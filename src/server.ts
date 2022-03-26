import Express from 'express';
import { config } from './config';
import * as aws from 'aws-sdk';
import *  as log4js from 'log4js';

log4js.configure(config.log4js);

const app = Express();
const port = config.port;

export const logger = log4js.getLogger('[Server]');

app.get('/', (req, res) => {
    if (!req.header('apikey')) {
        logger.error('missing apikey in request header');
        return res.status(401).send('unauthorized');
    }
});

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});
