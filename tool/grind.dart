import 'package:grinder/grinder.dart';

/// Starts the build system.
Future<void> main(List<String> args) => grind(args);

@Task('Deletes all generated files and reset any saved state')
void clean() {
  defaultClean();
  ['.dart_tool/build', 'doc/api', webDir.path].map(getDir).forEach(delete);
  FileSet.fromDir(getDir('var'), pattern: '!.*', recurse: true).files.forEach(delete);
}

@Task('Uploads the results of the code coverage')
void coverage() => Pub.run('coveralls', arguments: ['var/lcov.info']);

@Task('Builds the documentation')
Future<void> doc() async {
  await getFile('CHANGELOG.md').copy('doc/about/changelog.md');
  await getFile('LICENSE.md').copy('doc/about/license.md');
  DartDoc.doc();
  run('mkdocs', arguments: ['build']);
}

@Task('Fixes the coding standards issues')
void fix() => DartFmt.format(existingSourceDirs, lineLength: 200);

@Task('Performs the static analysis of source code')
void lint() => Analyzer.analyze(existingSourceDirs);

@DefaultTask('Runs the test suites')
void test() => Pub.run('build_runner', arguments: ['test', '--delete-conflicting-outputs']);

@Task('Upgrades the project to the latest revision')
void upgrade() {
  run('git', arguments: ['reset', '--hard']);
  run('git', arguments: ['fetch', '--all', '--prune']);
  run('git', arguments: ['pull', '--rebase']);
  Pub.upgrade();
}

@Task('Watches for file changes')
void watch() => Pub.run('build_runner', arguments: ['watch', '--delete-conflicting-outputs']);
