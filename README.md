# Very Good Performance

[![Very Good Ventures](https://github.com/VeryGoodOpenSource/very_good_performance/raw/main/assets/vgv_logo.png)](https://verygood.ventures)

Developed with 💙 by [Very Good Ventures](https://verygood.ventures) 🦄

[![ci](https://github.com/VeryGoodOpenSource/very_good_performance/workflows/ci/badge.svg)](https://github.com/VeryGoodOpenSource/very_good_analysis/actions)
[![pub package](https://img.shields.io/pub/v/very_good_performance.svg)](https://pub.dartlang.org/packages/very_good_performance)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis][badge]][badge_link]

---

Utility on top of the [Flutter Driver API](https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html) that facilitates measuring the performance of your app in an automated way

## Usage

#### `very_good_performance.yaml`

Add a new file at root of your project named `very_good_performance.yaml` with the following fields.

You can modify these values to match your own performance expectations.

```yaml
performance_report:
  directory: performance/reports
integration_test_expectations:
  should_fail_build_on_warning: true
  should_fail_build_on_error: true
performance_metrics:
  missed_frames_threshold:
    warning: 5
    error: 10
  average_frame_build_rate_threshold:
    warning_time_in_milliseconds: 14.0
    error_time_in_milliseconds: 16.0
  worst_frame_build_rate_threshold:
    warning_time_in_milliseconds: 14.0
    error_time_in_milliseconds: 16.0
```

#### Running tests with `FlutterDrive`

Simply wrap your `FlutterDriver` tests with the method `capturePerformanceReport` to start collecting performance information

```dart
test('tapping on the Increment button updates the counter', () async {
  await driver.capturePerformanceReport(
    reportName: 'counter_performance',
    action: () async {
      await driver.tap(find.byType(FloatingActionButton));
      expect(await driver.getText(find.text('1')), '1');
      await driver.tap(find.byType(FloatingActionButton));
      expect(await driver.getText(find.text('2')), '2');
    },
  );
});
```

At the end of the execution, you will see a similar report to this one:

![Performance Report](https://github.com/VeryGoodOpenSource/very_good_performance/raw/main/assets/performance_report.png)

#### Running the example project

You can find an `example` project that showcases how to use this library.

```bash
$> cd example
$> flutter drive --target=e2e/e2e.dart --driver=e2e/counter_test.dart -d macos --profile
```

You should see the Counter app running and, at the end of the execution, it will print the performance overview in the console, and will generate the performance reports under `e2e/performance/reports`.

[very good analysis]: https://github.com/VeryGoodOpenSource/very_good_analysis
[badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[badge_link]: https://pub.dev/packages/very_good_analysis
