module.exports = {
  reporters: [
    "default",
    [
      "jest-html-reporters",
      {
        publicPath: "./tests/reporters",
        filename: "report.html",
        expand: true,
      },
    ],
  ],
  preset: "@vue/cli-plugin-unit-jest",
}
