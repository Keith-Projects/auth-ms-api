import Express, { response } from 'express';
import { config } from './config';
import * as aws from 'aws-sdk';
import *  as log4js from 'log4js';

log4js.configure(config.log4js);

const app = Express();
const port = config.port;

export const logger = log4js.getLogger('[Server]');

app.get('/healthcheck', (req, res) => {
    return res.status(200).send('clean');
});

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});
