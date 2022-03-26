const logLevel = `all`;
export const config = {
    port: 5000,
    log4js: {
        appenders: {
            aws: {
                type: "log4js-cloudwatch-appender",
                region: 'us-east-1',
                logGroup: `auth-ms-api`,
                logStream: `${process.env.environment || 'local_dev'}`,
            },
            out: {
                type: 'stdout'
            }
        },
        categories: {
            default: {
                appenders: ['out', 'aws'],
                level: `${logLevel}`
            },
        }
    }
};
