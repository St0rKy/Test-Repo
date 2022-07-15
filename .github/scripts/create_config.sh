#!/bin/sh
WPSalts=$(wget https://api.wordpress.org/secret-key/1.1/salt/ -q -O -)

cat <<EOF > wp-config.php
<?php
/**
* The base configuration for WordPress (Some other Changes22223424)
*
* The wp-config.php creation script uses this file during the installation.
* You don't have to use the web site, you can copy this file to "wp-config.php"
* and fill in the values.
*
* This file contains the following configurations:
*
* * Database settings
* * Secret keys
* * Database table prefix
* * Localized language
* * ABSPATH
*
* @link https://wordpress.org/support/article/editing-wp-config-php/
*
* @package WordPress
*/

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', '$1');

/** Database username */
define('DB_USER', '$2');

/** Database password */
define('DB_PASSWORD', '$3');

/** Database hostname */
define('DB_HOST', 'localhost');

/** Database charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The database collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

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
$WPSalts
define( 'WP_CACHE_KEY_SALT', '$4' );
/**#@-*/

/**
* WordPress database table prefix.
*
* You can have multiple installations in one database if you give each
* a unique prefix. Only numbers, letters, and underscores please!
*/
\$table_prefix = 'wp_';

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
define('WP_DEBUG', false);

/* Add any custom values between this line and the "stop editing" line. */
define( 'MULTISITE', true );
define( 'SUBDOMAIN_INSTALL', true );
define( 'DOMAIN_CURRENT_SITE', '$5' );
define( 'PATH_CURRENT_SITE', '/' );
define( 'SITE_ID_CURRENT_SITE', 1 );
define( 'BLOG_ID_CURRENT_SITE', 1 );
define( 'WPLANG', 'fr_FR' );
define('DOCTOLIB_PROSPECT_URL_API_KEY', '$6');
define('PROSPECT_ENDPOINT','https://info-staging.doctolib.fr');

define( 'MATOMO_SITE_ID', '1' );
define( 'CMS_ENDPOINT', 'https://info.doctolib.fr/cms/specialities' );

define( 'S3_UPLOADS_BUCKET', 'doctolib-doctolib-b2b-wordpress-assets-tooling-aws-global-de' );
define( 'S3_UPLOADS_REGION', 'eu-central-1' ); // the s3 bucket region (excluding the rest of the URL);
define('ACF_LITE', 'true');

define( 'S3_UPLOADS_KEY', '$7' );
define( 'S3_UPLOADS_SECRET', '$8' );
define( 'S3_UPLOADS_USE_INSTANCE_PROFILE', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
EOF