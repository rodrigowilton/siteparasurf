// =============================================
// PM2 Ecosystem — Instituto ParaSurf Landing
// Porta: 3016
// =============================================
module.exports = {
  apps: [
    {
      name: 'parasurf-landing',
      script: 'node_modules/.bin/serve',
      args: '-s . -l 3016',
      cwd: '/var/www/parasurf-landing',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '128M',
      env: {
        NODE_ENV: 'production',
        PORT: 3016,
      },
      log_date_format: 'YYYY-MM-DD HH:mm:ss',
      out_file: '/var/log/pm2/parasurf-landing-out.log',
      error_file: '/var/log/pm2/parasurf-landing-error.log',
      merge_logs: true,
    },
  ],
};
