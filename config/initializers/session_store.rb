AppName::Application.config.session_store :redis_store, {
  servers: [
    {
      host: "redis",
      port: 6379,
      db: 2,
      namespace: "session"
    },
  ],
  expire_after: 30.minutes
}