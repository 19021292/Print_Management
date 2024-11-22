module.exports = {
    devServer: {
      proxy: {
        '/api': {
          target: 'http://localhost:5129', 
          changeOrigin: true,
        },
      },
    },
  };
  