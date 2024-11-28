import { config as envConfig } from "dotenv";

envConfig({
  path: ".env",
});

const _ = (key: string) => process.env[key];

const config = {
  PORT: _("PORT"),
  APP_NAME: _("APP_NAME"),
};

export default config;
