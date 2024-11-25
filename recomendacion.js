const tf = require('@tensorflow/tfjs-node');
const yahooFinance = require('yahoo-finance2').default;

// Normalizar los datos entre 0 y 1
const normalizeData = (data) => {
    const max = Math.max(...data);
    const min = Math.min(...data);
    const normalized = data.map((value) => (value - min) / (max - min));
    return { normalized, max, min };
};

// Desnormalizar los datos para obtener el precio real
const denormalize = (value, max, min) => value * (max - min) + min;

// Entrenar el modelo
const trainModel = async (data) => {
    const prices = data.map((d) => d.close);

    // Normalizar precios
    const { normalized, max, min } = normalizeData(prices);

    const inputs = normalized.slice(0, -1);
    const outputs = normalized.slice(1);

    const inputTensor = tf.tensor2d(inputs, [inputs.length, 1]);
    const outputTensor = tf.tensor2d(outputs, [outputs.length, 1]);

    const model = tf.sequential();
    model.add(tf.layers.dense({ units: 50, activation: 'relu', inputShape: [1] }));
    model.add(tf.layers.dense({ units: 1 }));

    model.compile({ optimizer: 'adam', loss: 'meanSquaredError' });

    await model.fit(inputTensor, outputTensor, { epochs: 10 });

    return { model, max, min };
};

// Obtener datos históricos
const getHistoricalData = async (ticker) => {
    const queryOptions = { period1: '2010-01-01', period2: '2024-11-23', interval: '1d' };

    const result = await yahooFinance.historical(ticker, queryOptions);

    if (!result || result.length < 2) {
        throw new Error(`Datos insuficientes para el ticker: ${ticker}`);
    }

    return result;
};

// Predecir el próximo valor
const predictNext = (model, currentPrice, max, min) => {
    const normalizedPrice = (currentPrice - min) / (max - min);
    const prediction = model.predict(tf.tensor2d([normalizedPrice], [1, 1]));
    const denormalizedPrediction = denormalize(prediction.arraySync()[0][0], max, min);
    return denormalizedPrediction;
};

// Predecir múltiples días
const predictMultipleDays = (model, lastPrice, max, min, days) => {
    const predictions = [];
    let currentPrice = lastPrice;

    for (let i = 0; i < days; i++) {
        const predictedPrice = predictNext(model, currentPrice, max, min);
        
        // Introducir variabilidad para simular comportamiento del mercado
        const variability = (Math.random() * 2 - 1) * 0.02 * currentPrice; // +/- 2%
        currentPrice = predictedPrice + variability;

        predictions.push({
            day: i + 1,
            date: new Date(Date.now() + i * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            price: currentPrice,
        });
    }

    return predictions;
};



module.exports = { trainModel, getHistoricalData, predictNext, predictMultipleDays };
