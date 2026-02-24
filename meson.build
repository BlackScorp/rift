project('rift', 'vala', version: '0.1', default_options: ['buildtype=release'])

src_files = files('src/main.vala')


executable(
  'rift',
  src_files,
  dependencies: [
    dependency('gtk4'),
    dependency('gtk4-layer-shell-0'),
    dependency('gio-2.0')
  ]
)