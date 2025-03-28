/** @type {import('next').NextConfig} */
const nextConfig = {
    experimental: {
      serverComponentsExternalPackages: ['knex'],
      serverActions: {
        allowedForwardedHosts: ['localhost'],
        allowedOrigins: ['localhost:3000'],
      },
    },
    // output: 'standalone',
  };
  
  module.exports = nextConfig;