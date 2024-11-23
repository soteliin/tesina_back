const tf = require('@tensorflow/tfjs-node');
const yahooFinance = require('yahoo-finance2').default;

// Entrenar un modelo para una empresa
const trainModel = async (data) => {
    const prices = data.map((d) => d.close);

    const inputs = prices.slice(0, -1);
    const outputs = prices.slice(1);

    const inputTensor = tf.tensor2d(inputs, [inputs.length, 1]);
    const outputTensor = tf.tensor2d(outputs, [outputs.length, 1]);

    const model = tf.sequential();
    model.add(tf.layers.dense({ units: 50, activation: 'relu', inputShape: [1] }));
    model.add(tf.layers.dense({ units: 1 }));

    model.compile({ optimizer: 'adam', loss: 'meanSquaredError' });

    await model.fit(inputTensor, outputTensor, { epochs: 50 });

    return model;
};

// Obtener datos históricos para una empresa
const getHistoricalData = async (ticker) => {
    const queryOptions = { period1: '2020-11-01', period2: '2024-11-22', interval: '1d' };

    const result = await yahooFinance.historical(ticker, queryOptions);

    if (!result || result.length < 2) {
        throw new Error(`Datos insuficientes para el ticker: ${ticker}`);
    }

    return result;
};

// Realizar predicción para una empresa
const predict = (model, currentPrice) => {
    const prediction = model.predict(tf.tensor2d([currentPrice], [1, 1]));
    return prediction.arraySync()[0][0];
};

module.exports = { trainModel, getHistoricalData, predict };
