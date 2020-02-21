const XunitViewer = require('xunit-viewer/cli')
const result = XunitViewer({
    results: '../test-junit-report.xml',
    suites: [],
    xml: '',
    ignore: [],
    output: "./elixir/index.html",
    title: 'WhatsWhere',
    port: false,
    watch: false,
    color: true,
    filter: {},
    format: 'html'
})
