//stories: ['../stories/**/*.stories.js'],
module.exports = {
  stories: ['../app/javascript/components/**/*.stories.js'],
  addons: ['@storybook/addon-actions', '@storybook/addon-links'],
  webpackFinal: async config => {
    // do mutation to the config

    return config;
  },
};
