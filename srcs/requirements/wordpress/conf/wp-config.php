<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// https://github.com/rhubarbgroup/redis-cache/wiki/Connection-Parameters

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WP_DB_NAME') );

/** MySQL database username */
define( 'DB_USER', getenv('WP_DB_USER') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('WP_DB_PASSWORD') );

/** MySQL hostname */
define( 'DB_HOST', getenv('MYSQL_HOSTNAME') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */

define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

/**#@-*/
/* insert keys here, --- sono di default --- */
define('AUTH_KEY',         'hyXHV$t=>2Y[q]%fcv0u[?Q)e(_AlCYWgkgFq;Lxz~(o:%5**C1~DIgu>vH%XdFh');
define('SECURE_AUTH_KEY',  'v!G_(kj^U%sCG=P=m/Y%|^xye0l$A%G6K2EHBre8O*/{*T=f3{FuNc2b?qPZaC_H');
define('LOGGED_IN_KEY',    ')Z0QGh-QV[|aH:LV0%AK7/!*k0~Gu/6EpU&)I$%t]xbN|@8=}N{c!(5[Q}yOM-HF');
define('NONCE_KEY',        '?d;[z!EZ}JF-+8b^Vh)5T}:7:mAe)n|d+#?wBlpBod (vcxH:irKV?xM*W|)D?A*');
define('AUTH_SALT',        'LGH07hJW6ncvoDDlwL W=])J!7]|fMVYdagy<m5vafh[]*69~1xpKw@}_9exh*Qx');
define('SECURE_AUTH_SALT', 'B)}PwRy*w1X:?^C0E-,c-yzvSZ;2L_+y=%4+&[E).k{Qkw0$V4IwXK$r <Ux? rW');
define('LOGGED_IN_SALT',   '#51h}AvNzD|WQTsw]27s=r[_VGLy6;Z<bKEY=S+O)4^V^O=>y,$x+r_`xUhY^T:_');
define('NONCE_SALT',       ',Y]E+Hi_-I+zWFa#{xC]1gcx$B7#S-ImJ`)7,3|iU?[pUQ@qQ%*x Fs+0?DKdAPy');

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
