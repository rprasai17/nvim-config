return {
  'will-lynas/grapple-line.nvim',
  dependencies = {
    'cbochs/grapple.nvim',
  },
  version = '1.x',
  opts = {
    number_of_files = 8,
    colors = {
      active = 'lualine_a_normal',
      inactive = 'lualine_b_normal',
    },
    -- Accepted values:
    -- "unique_filename" shows the filename and parent directories if needed
    -- "filename" shows the filename only
    mode = 'unique_filename',
    -- If a tag name is set, use that instead of the filename
    show_names = false,
    -- Accepted values:
    -- "none" - overflowing files are ignored
    -- "ellipsis" - if there are overflowing files an ellipsis will be shown
    overflow = 'ellipsis',
    -- Files for which the parent directory should always be shown
    always_show_parent = {
      -- Frontend / React
      'index.js',
      'index.ts',
      'index.tsx',
      'index.jsx',
      'main.js',
      'main.ts',
      'App.js',
      'App.tsx',
      'layout.js',
      'layout.tsx',
      'page.js',
      'page.tsx',
      'component.js',
      'component.tsx',
      'styles.js',
      'style.js',
      'styles.ts',
      'theme.js',
      'theme.ts',
      'constants.js',
      'constants.ts',
      'hooks.js',
      'hooks.ts',
      'useEffect.js',
      'useEffect.ts',
      'reducer.js',
      'context.js',
      'provider.js',

      -- Backend / Node / Express
      'server.js',
      'app.js',
      'index.mjs',
      'routes.js',
      'router.js',
      'controller.js',
      'controllers.js',
      'model.js',
      'models.js',
      'schema.js',
      'schemas.js',
      'service.js',
      'services.js',
      'middleware.js',
      'middlewares.js',
      'config.js',
      'config.mjs',
      'env.js',
      'database.js',
      'db.js',
      'connect.js',

      -- Shared / utilities / infra
      'utils.js',
      'helpers.js',
      'helper.js',
      'types.js',
      'test.js',
      'spec.js',
      'setup.js',
      'package.json',
      'tsconfig.json',
      'vite.config.js',
      'webpack.config.js',
      'README.md',
      'LICENSE',
      '.env',
      '.env.local',
      'Dockerfile',
      'docker-compose.yml',
    },
  },
}
