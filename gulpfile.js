// generated on 2016-09-19 using generator-webapp 2.1.0
const gulp = require('gulp');
const del = require('del');
const wiredep = require('wiredep').stream;
const gulpLoadPlugins = require('gulp-load-plugins');
const $ = gulpLoadPlugins();
const mainBowerFiles = require('main-bower-files')
const browserSync = require('browser-sync');
const reload = browserSync.reload;
const connect = require('gulp-connect-php');

// Error Alerts
function errorAlert(error){
	$.notify.onError({
		title: "Error compiling file",
		message: 'Check your terminal.',
		sound: "Sosumi"
	})(error); //Error Notification
	console.log(error);
	this.emit("end"); //End function
};

gulp.task("copy-php", function () {
    return gulp.src(paths.pages)
        .pipe(gulp.dest("dist"));
});

gulp.task('scripts', () => {
  return gulp.src('app/src/scripts/**/*.coffee')
    .pipe($.concat('app.coffee'))
    .pipe($.plumber())
    .pipe($.sourcemaps.init())
    .pipe($.coffee())
    .pipe($.sourcemaps.write('.'))
    .pipe(gulp.dest('dist/scripts'))
    .pipe(browserSync.stream());
});

gulp.task('styles', () => {
  gulp.src('app/src/styles/*.scss')
    .pipe($.plumber())
    .pipe($.sourcemaps.init())
    .pipe($.sass.sync({
      outputStyle: 'expanded',
      precision: 10,
      includePaths: ['.']
    }).on('error', $.sass.logError))
    .pipe($.autoprefixer({browsers: ['> 1%', 'last 2 versions', 'Firefox ESR']}))
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest('dist/styles'))
    .pipe(browserSync.stream());

});

gulp.task('images', () => {
  return gulp.src('app/src/images/**/*')
    .pipe($.cache($.imagemin({
      progressive: true,
      interlaced: true,
      // don't remove IDs from SVGs, they are often used
      // as hooks for embedding and styling
      svgoPlugins: [{cleanupIDs: false}]
    })))
    .pipe(gulp.dest('dist/images'));
});


gulp.task('vendor', () => {

  // Vendor.js
  gulp.src(mainBowerFiles('**/*.js'))
    .pipe($.plumber({errorHandler: errorAlert}))
    .pipe($.concat('vendor.js'))
    .pipe(gulp.dest('dist/scripts'));

  // Vendor.css
  gulp.src(mainBowerFiles('**/*.css'))
    .pipe($.plumber({errorHandler: errorAlert}))
    .pipe($.concat('vendor.css'))
    .pipe(gulp.dest('dist/styles/'));

});

gulp.task('extras', () => {
  return gulp.src([
    'app/*.*',
    '!app/*.php'
  ], {
    dot: true
  }).pipe(gulp.dest('dist'));
});

gulp.task('clean', del.bind(null, ['.tmp', 'dist', 'build']));

// inject bower components
gulp.task('wiredep', () => {
  gulp.src('app/src/styles/*.scss')
    .pipe(wiredep({
      ignorePath: /^(\.\.\/)+/
    }))
    .pipe(gulp.dest('app/src/styles'));

  gulp.src('app/**/*.php')
    .pipe(wiredep({
      exclude: ['bootstrap-sass'],
      ignorePath: /^(\.\.\/)*\.\./
    }))
    .pipe(gulp.dest('app'));
});

gulp.task('browser-sync', function() {
  connect.server({ port: 8010, keepalive: true}, function (){
    browserSync({
        proxy: '127.0.0.1:8010',
        port: 8080,
        open: true,
    });
  });
});

gulp.task('serve', ['make', 'browser-sync'], () => {

  gulp.watch('app/src/styles/*.scss', ['styles']);
  gulp.watch('app/src/scripts/**/*.coffee', ['scripts']);
  gulp.watch('app/src/images/**/*', ['images']);

  gulp.watch("app/**/*.php").on('change', browserSync.reload);

});

gulp.task('build', ['make'], () => {

  gulp.src(['app/**', '!app/{src,src/**}'])
    .pipe(gulp.dest('build/app'));

  gulp.src(['dist/**/*'])
    .pipe(gulp.dest('build/dist'));

  gulp.src('*.php')
    .pipe(gulp.dest('build'));

  gulp.src('./vendor/**/*.php')
    .pipe(gulp.dest('build/vendor'));
});

gulp.task('make', ['styles', 'scripts', 'images', 'vendor', 'extras']), () => {
  console.log('Files compiled');
};

gulp.task('default', ['serve'], () => {});
