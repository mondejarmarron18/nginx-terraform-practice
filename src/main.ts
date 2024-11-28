import express from "express";
import config from "./utils/config";

const app = express();
const port = config.PORT;

if (!port) {
  throw new Error("PORT is not defined");
}

app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    appName: config.APP_NAME,
    message: "Request received",
    isDelay: false,
  });
});

app.get("/users", (req, res) => {
  res.json([
    {
      id: 1,
      name: "John Doe",
      email: "johndoe@me.com",
      hobbies: ["coding", "reading", "sleeping"],
    },
  ]);
});

app.listen(port, () =>
  console.log(`Server ${config.APP_NAME} running on port ${port}`)
);
