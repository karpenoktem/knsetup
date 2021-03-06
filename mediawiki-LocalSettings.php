<?php

# This file was automatically generated by the MediaWiki installer.
# If you make manual changes, please keep track in case you need to
# recreate them later.
#
# See includes/DefaultSettings.php for all configurable settings
# and their default values, but don't forget to make changes in _this_
# file, not there.

# If you customize your file layout, set $IP to the directory that contains
# the other MediaWiki files. It will be used as a base to locate files.
if( defined( 'MW_INSTALL_PATH' ) ) {
	$IP = MW_INSTALL_PATH;
} else {
	$IP = dirname( __FILE__ );
}

$path = array( $IP, "$IP/includes", "$IP/languages" );
set_include_path( implode( PATH_SEPARATOR, $path ) . PATH_SEPARATOR . get_include_path() );

require_once( "$IP/includes/DefaultSettings.php" );

# If PHP's memory limit is very low, some operations may fail.
# ini_set( 'memory_limit', '20M' );

if ( $wgCommandLineMode ) {
	if ( isset( $_SERVER ) && array_key_exists( 'REQUEST_METHOD', $_SERVER ) ) {
		die( "This script must be run from the command line\n" );
	}
}
## Uncomment this to disable output compression
# $wgDisableOutputCompression = true;

$wgSitename         = "KnWiki";

## The URL base path to the directory containing the wiki;
## defaults for all runtime URL paths are based off of this.
$wgScriptPath       = "/W";
$wgArticlePath      = "/wiki/$1";
$wgUsePathInfo      = True;
$wgScriptExtension  = ".php";

## For more information on customizing the URLs please see:
## http://www.mediawiki.org/wiki/Manual:Short_URL

$wgEnableEmail      = true;
$wgEnableUserEmail  = true;

$wgEmergencyContact = "webcie@%HTTP_DOMAIN%";
$wgPasswordSender = "root@%HTTP_DOMAIN%";

## For a detailed description of the following switches see
## http://www.mediawiki.org/wiki/Extension:Email_notification 
## and http://www.mediawiki.org/wiki/Extension:Email_notification
## There are many more options for fine tuning available see
## /includes/DefaultSettings.php
## UPO means: this is also a user preference option
$wgEnotifUserTalk = true; # UPO
$wgEnotifWatchlist = true; # UPO
$wgEmailAuthentication = true;

$wgDBtype           = "mysql";
$wgDBserver         = "localhost";
$wgDBname           = "%MYSQL_DB%";
$wgDBuser           = "%MYSQL_USER%";
$wgDBpassword       = "%MYSQL_PASSWORD%";

# MySQL specific settings
$wgDBprefix         = "";

# MySQL table options to use during installation or update
$wgDBTableOptions   = "ENGINE=InnoDB, DEFAULT CHARSET=utf8";

# Experimental charset support for MySQL 4.1/5.0.
$wgDBmysql5 = true;

# Postgres specific settings
$wgDBport           = "5432";
$wgDBmwschema       = "mediawiki";
$wgDBts2schema      = "public";

## Shared memory settings
# $wgMainCacheType = CACHE_MEMCACHED;
# $wgMemCachedServers = array('127.0.0.1:11211');

## To enable image uploads, make sure the 'images' directory
## is writable, then set this to true:
$wgEnableUploads       = true;
$wgUseImageMagick = true;
$wgImageMagickConvertCommand = "/usr/bin/convert";

## If you want to use image uploads under safe mode,
## create the directories images/archive, images/thumb and
## images/temp, and make them all writable. Then uncomment
## this, if it's not already uncommented:
# $wgHashedUploadDirectory = false;

## If you have the appropriate support software installed
## you can enable inline LaTeX equations:
$wgUseTeX           = false;

$wgLocalInterwiki   = $wgSitename;

$wgLanguageCode = "nl";

$wgProxyKey = '%PROXY_KEY%';

## Default skin: you can change the default skin. Use the internal symbolic
## names, ie 'standard', 'nostalgia', 'cologneblue', 'monobook':
$wgDefaultSkin = 'monobook';

## For attaching licensing metadata to pages, and displaying an
## appropriate copyright notice / icon. GNU Free Documentation
## License and Creative Commons licenses are supported so far.
$wgEnableCreativeCommonsRdf = true;
$wgRightsPage = ""; # Set to the title of a wiki page that describes your license/copyright
$wgRightsUrl = "http://www.gnu.org/copyleft/fdl.html";
$wgRightsText = "GNU Free Documentation License 1.2";
$wgRightsIcon = "${wgScriptPath}/skins/common/images/gnu-fdl.png";
# $wgRightsCode = "gfdl"; # Not yet used

$wgDiff3 = "/usr/bin/diff3";

# When you make changes to this configuration file, this will make
# sure that cached pages are cleared.
$configdate = gmdate( 'YmdHis', @filemtime( __FILE__ ) );
$wgCacheEpoch = max( $wgCacheEpoch, $configdate );



#
# Voorkom dat iedereen een account maakt
#
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['*']['read'] = false;
$wgGroupPermissions['*']['createaccount'] = false;
$wgGroupPermissions['webcie']['delete'] = true;
$wgGroupPermissions['webcie']['undelete'] = true;
$wgGroupPermissions['webcie']['browsearchive'] = true;
$wgGroupPermissions['webcie']['deletedhistory'] = true;

// [2010-11-25 jille] Toegevoegd
// [2012-02-29 jille] /w/ -> /W/
// [2012-07-29 jille] devlogo.png
$wgLogo = $wgScriptPath .'/skins/kn/devlogo.png';

# [2011-06-14 bas]
# [2012-07-29 jille]
# Stuur e-mail van veranderingen naar Jille en Bas
$wgUsersNotifiedOnAllChanges = array('Bas', 'Jille');

# [2011-09-10 jille]
$wgGroupPermissions['user']['createaccount'] = false;
$wgGroupPermissions['leden'] = $wgGroupPermissions['user'];
$wgGroupPermissions['user']['edit'] = false;
$wgGroupPermissions['user']['read'] = false;

# [2011-09-10 jille] Patrolling uit
$wgUseRCPatrol = false;
$wgGroupPermission['sysop']['patrol'] = false;

# [2011-09-10 jille] APC extensie
require_once($IP ."/extensions/APC/APC.php");
$wgGroupPermissions['sysop']['apc'] = true;

# [2011-12-30 jille] Renameuser extensie
require_once($IP ."/extensions/Renameuser/SpecialRenameuser.php");
