-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prj_test7_punbb
-- ------------------------------------------------------
-- Server version	5.1.66-0+squeeze1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `expire` int(10) unsigned DEFAULT NULL,
  `ban_creator` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bans`
--

LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(80) NOT NULL DEFAULT 'New Category',
  `disp_position` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Test category',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `censoring`
--

DROP TABLE IF EXISTS `censoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `censoring` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_for` varchar(60) NOT NULL DEFAULT '',
  `replace_with` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `censoring`
--

LOCK TABLES `censoring` WRITE;
/*!40000 ALTER TABLE `censoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `censoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `conf_name` varchar(255) NOT NULL DEFAULT '',
  `conf_value` text,
  PRIMARY KEY (`conf_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('o_cur_version','1.3.5'),('o_database_revision','4'),('o_board_title','Karpe Noktem testforum'),('o_board_desc','Een testforum voor Karpe Noktem'),('o_default_timezone','0'),('o_time_format','H:i:s'),('o_date_format','Y-m-d'),('o_check_for_updates','1'),('o_check_for_versions','1'),('o_timeout_visit','5400'),('o_timeout_online','300'),('o_redirect_delay','1'),('o_show_version','0'),('o_show_user_info','1'),('o_show_post_count','1'),('o_signatures','1'),('o_smilies','1'),('o_smilies_sig','1'),('o_make_links','1'),('o_default_lang','English'),('o_default_style','Oxygen'),('o_default_user_group','3'),('o_topic_review','15'),('o_disp_topics_default','30'),('o_disp_posts_default','25'),('o_indent_num_spaces','4'),('o_quote_depth','3'),('o_quickpost','1'),('o_users_online','1'),('o_censoring','0'),('o_ranks','1'),('o_show_dot','0'),('o_topic_views','1'),('o_quickjump','1'),('o_gzip','0'),('o_additional_navlinks',''),('o_report_method','0'),('o_regs_report','0'),('o_default_email_setting','1'),('o_mailing_list','webcie@karpenoktem.nl'),('o_avatars','1'),('o_avatars_dir','img/avatars'),('o_avatars_width','60'),('o_avatars_height','60'),('o_avatars_size','10240'),('o_search_all_forums','1'),('o_sef','Default'),('o_admin_email','webcie@karpenoktem.nl'),('o_webmaster_email','webcie@karpenoktem.nl'),('o_subscriptions','1'),('o_smtp_host',NULL),('o_smtp_user',NULL),('o_smtp_pass',NULL),('o_smtp_ssl','0'),('o_regs_allow','1'),('o_regs_verify','0'),('o_announcement','0'),('o_announcement_heading','Sample announcement'),('o_announcement_message','<p>Enter your announcement here.</p>'),('o_rules','0'),('o_rules_message','Enter your rules here.'),('o_maintenance','0'),('o_maintenance_message','The forums are temporarily down for maintenance. Please try again in a few minutes.<br /><br />Administrator'),('o_default_dst','0'),('p_message_bbcode','1'),('p_message_img_tag','1'),('p_message_all_caps','1'),('p_subject_all_caps','1'),('p_sig_all_caps','1'),('p_sig_bbcode','1'),('p_sig_img_tag','0'),('p_sig_length','400'),('p_sig_lines','4'),('p_allow_banned_email','1'),('p_allow_dupe_email','0'),('p_force_guest_email','1');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension_hooks`
--

DROP TABLE IF EXISTS `extension_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extension_hooks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `extension_id` varchar(50) NOT NULL DEFAULT '',
  `code` text,
  `installed` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension_hooks`
--

LOCK TABLES `extension_hooks` WRITE;
/*!40000 ALTER TABLE `extension_hooks` DISABLE KEYS */;
INSERT INTO `extension_hooks` VALUES ('aex_section_manage_end','pun_repository','if (file_exists($ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\'))\n	include $ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\';\nelse\n	include $ext_info[\'path\'].\'/lang/English/pun_repository.php\';\n\nrequire_once $ext_info[\'path\'].\'/pun_repository.php\';\n\n($hook = get_hook(\'pun_repository_pre_display_ext_list\')) ? eval($hook) : null;\n\n?>\n	<div class=\"main-subhead\">\n		<h2 class=\"hn\"><span><?php echo $lang_pun_repository[\'PunBB Repository\'] ?></span></h2>\n	</div>\n	<div class=\"main-content main-extensions\">\n		<p class=\"content-options options\"><a href=\"<?php echo $base_url ?>/admin/extensions.php?pun_repository_update&amp;csrf_token=<?php echo generate_form_token(\'pun_repository_update\') ?>\"><?php echo $lang_pun_repository[\'Clear cache\'] ?></a></p>\n<?php\n\nif (!defined(\'PUN_REPOSITORY_EXTENSIONS_LOADED\') && file_exists(FORUM_CACHE_DIR.\'cache_pun_repository.php\'))\n	include FORUM_CACHE_DIR.\'cache_pun_repository.php\';\n\nif (!defined(\'FORUM_EXT_VERSIONS_LOADED\') && file_exists(FORUM_CACHE_DIR.\'cache_ext_version_notifications.php\'))\n	include FORUM_CACHE_DIR.\'cache_ext_version_notifications.php\';\n\n// Regenerate cache only if automatic updates are enabled and if the cache is more than 12 hours old\nif (!defined(\'PUN_REPOSITORY_EXTENSIONS_LOADED\') || !defined(\'FORUM_EXT_VERSIONS_LOADED\') || ($pun_repository_extensions_timestamp < $forum_ext_versions_update_cache))\n{\n	$pun_repository_error = \'\';\n\n	if (pun_repository_generate_cache($pun_repository_error))\n	{\n		require FORUM_CACHE_DIR.\'cache_pun_repository.php\';\n	}\n	else\n	{\n\n		?>\n		<div class=\"ct-box warn-box\">\n			<p class=\"warn\"><?php echo $pun_repository_error ?></p>\n		</div>\n		<?php\n\n		// Stop processing hook\n		return;\n	}\n}\n\n$pun_repository_parsed = array();\n$pun_repository_skipped = array();\n\n// Display information about extensions in repository\nforeach ($pun_repository_extensions as $pun_repository_ext)\n{\n	// Skip installed extensions\n	if (isset($inst_exts[$pun_repository_ext[\'id\']]))\n	{\n		$pun_repository_skipped[\'installed\'][] = $pun_repository_ext[\'id\'];\n		continue;\n	}\n\n	// Skip uploaded extensions (including incorrect ones)\n	if (is_dir(FORUM_ROOT.\'extensions/\'.$pun_repository_ext[\'id\']))\n	{\n		$pun_repository_skipped[\'has_dir\'][] = $pun_repository_ext[\'id\'];\n		continue;\n	}\n\n	// Check for unresolved dependencies\n	if (isset($pun_repository_ext[\'dependencies\']))\n		$pun_repository_ext[\'dependencies\'] = pun_repository_check_dependencies($inst_exts, $pun_repository_ext[\'dependencies\']);\n\n	if (empty($pun_repository_ext[\'dependencies\'][\'unresolved\']))\n	{\n		// \'Download and install\' link\n		$pun_repository_ext[\'options\'] = array(\'<a href=\"\'.$base_url.\'/admin/extensions.php?pun_repository_download_and_install=\'.$pun_repository_ext[\'id\'].\'&amp;csrf_token=\'.generate_form_token(\'pun_repository_download_and_install_\'.$pun_repository_ext[\'id\']).\'\">\'.$lang_pun_repository[\'Download and install\'].\'</a>\');\n	}\n	else\n		$pun_repository_ext[\'options\'] = array();\n\n	$pun_repository_parsed[] = $pun_repository_ext[\'id\'];\n\n	// Direct links to archives\n	$pun_repository_ext[\'download_links\'] = array();\n	foreach (array(\'zip\', \'tgz\', \'7z\') as $pun_repository_archive_type)\n		$pun_repository_ext[\'download_links\'][] = \'<a href=\"\'.PUN_REPOSITORY_URL.\'/\'.$pun_repository_ext[\'id\'].\'/\'.$pun_repository_ext[\'id\'].\'.\'.$pun_repository_archive_type.\'\">\'.$pun_repository_archive_type.\'</a>\';\n\n	($hook = get_hook(\'pun_repository_pre_display_ext_info\')) ? eval($hook) : null;\n\n	// Let\'s ptint it all out\n?>\n		<div class=\"ct-box info-box extension available\" id=\"<?php echo $pun_repository_ext[\'id\'] ?>\">\n			<h3 class=\"ct-legend hn\"><span><?php echo forum_htmlencode($pun_repository_ext[\'title\']).\' \'.$pun_repository_ext[\'version\'] ?></span></h3>\n			<p><?php echo forum_htmlencode($pun_repository_ext[\'description\']) ?></p>\n<?php\n\n	// List extension dependencies\n	if (!empty($pun_repository_ext[\'dependencies\'][\'dependency\']))\n		echo \'\n			<p>\', $lang_pun_repository[\'Dependencies:\'], \' \', implode(\', \', $pun_repository_ext[\'dependencies\'][\'dependency\']), \'</p>\';\n\n?>\n			<p><?php echo $lang_pun_repository[\'Direct download links:\'], \' \', implode(\' \', $pun_repository_ext[\'download_links\']) ?></p>\n<?php\n\n	// List unresolved dependencies\n	if (!empty($pun_repository_ext[\'dependencies\'][\'unresolved\']))\n		echo \'\n			<div class=\"ct-box warn-box\">\n				<p class=\"warn\">\', $lang_pun_repository[\'Resolve dependencies:\'], \' \', implode(\', \', array_map(create_function(\'$dep\', \'return \\\'<a href=\"#\\\'.$dep.\\\'\">\\\'.$dep.\\\'</a>\\\';\'), $pun_repository_ext[\'dependencies\'][\'unresolved\'])), \'</p>\n			</div>\';\n\n	// Actions\n	if (!empty($pun_repository_ext[\'options\']))\n		echo \'\n			<p class=\"options\">\', implode(\' \', $pun_repository_ext[\'options\']), \'</p>\';\n\n?>\n		</div>\n<?php\n\n}\n\n?>\n		<div class=\"ct-box warn-box\">\n			<p class=\"warn\"><?php echo $lang_pun_repository[\'Files mode and owner\'] ?></p>\n		</div>\n<?php\n\nif (empty($pun_repository_parsed) && (count($pun_repository_skipped[\'installed\']) > 0 || count($pun_repository_skipped[\'has_dir\']) > 0))\n{\n	($hook = get_hook(\'pun_repository_no_extensions\')) ? eval($hook) : null;\n\n	?>\n		<div class=\"ct-box info-box\">\n			<p class=\"warn\"><?php echo $lang_pun_repository[\'All installed or downloaded\'] ?></p>\n		</div>\n	<?php\n\n}\n\n($hook = get_hook(\'pun_repository_after_ext_list\')) ? eval($hook) : null;\n\n?>\n	</div>\n<?php',1362927424,5),('aex_new_action','pun_repository','// Clear pun_repository cache\nif (isset($_GET[\'pun_repository_update\']))\n{\n	// Validate CSRF token\n	if (!isset($_POST[\'csrf_token\']) && (!isset($_GET[\'csrf_token\']) || $_GET[\'csrf_token\'] !== generate_form_token(\'pun_repository_update\')))\n		csrf_confirm_form();\n\n	if (file_exists($ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\'))\n		include $ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\';\n	else\n		include $ext_info[\'path\'].\'/lang/English/pun_repository.php\';\n\n	@unlink(FORUM_CACHE_DIR.\'cache_pun_repository.php\');\n	if (file_exists(FORUM_CACHE_DIR.\'cache_pun_repository.php\'))\n		message($lang_pun_repository[\'Unable to remove cached file\'], \'\', $lang_pun_repository[\'PunBB Repository\']);\n\n	redirect($base_url.\'/admin/extensions.php?section=manage\', $lang_pun_repository[\'Cache has been successfully cleared\']);\n}\n\nif (isset($_GET[\'pun_repository_download_and_install\']))\n{\n	$ext_id = preg_replace(\'/[^0-9a-z_]/\', \'\', $_GET[\'pun_repository_download_and_install\']);\n\n	// Validate CSRF token\n	if (!isset($_POST[\'csrf_token\']) && (!isset($_GET[\'csrf_token\']) || $_GET[\'csrf_token\'] !== generate_form_token(\'pun_repository_download_and_install_\'.$ext_id)))\n		csrf_confirm_form();\n\n	// TODO: Should we check again for unresolved dependencies here?\n\n	if (file_exists($ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\'))\n		include $ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\';\n	else\n		include $ext_info[\'path\'].\'/lang/English/pun_repository.php\';\n\n	require_once $ext_info[\'path\'].\'/pun_repository.php\';\n\n	($hook = get_hook(\'pun_repository_download_and_install_start\')) ? eval($hook) : null;\n\n	// Download extension\n	$pun_repository_error = pun_repository_download_extension($ext_id, $ext_data);\n\n	if ($pun_repository_error == \'\')\n	{\n		if (empty($ext_data))\n			redirect($base_url.\'/admin/extensions.php?section=manage\', $lang_pun_repository[\'Incorrect manifest.xml\']);\n\n		// Validate manifest\n		$errors = validate_manifest($ext_data, $ext_id);\n		if (!empty($errors))\n			redirect($base_url.\'/admin/extensions.php?section=manage\', $lang_pun_repository[\'Incorrect manifest.xml\']);\n\n		// Everything is OK. Start installation.\n		redirect($base_url.\'/admin/extensions.php?install=\'.urlencode($ext_id), $lang_pun_repository[\'Download successful\']);\n	}\n\n	($hook = get_hook(\'pun_repository_download_and_install_end\')) ? eval($hook) : null;\n}\n\n// Handling the download and update extension action\nif (isset($_GET[\'pun_repository_download_and_update\']))\n{\n	$ext_id = preg_replace(\'/[^0-9a-z_]/\', \'\', $_GET[\'pun_repository_download_and_update\']);\n\n	// Validate CSRF token\n	if (!isset($_POST[\'csrf_token\']) && (!isset($_GET[\'csrf_token\']) || $_GET[\'csrf_token\'] !== generate_form_token(\'pun_repository_download_and_update_\'.$ext_id)))\n		csrf_confirm_form();\n\n	if (file_exists($ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\'))\n		include $ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\';\n	else\n		include $ext_info[\'path\'].\'/lang/English/pun_repository.php\';\n\n	require_once $ext_info[\'path\'].\'/pun_repository.php\';\n\n	$pun_repository_error = \'\';\n\n	($hook = get_hook(\'pun_repository_download_and_update_start\')) ? eval($hook) : null;\n\n	@pun_repository_rm_recursive(FORUM_ROOT.\'extensions/\'.$ext_id.\'.old\');\n\n	// Check dependancies\n	$query = array(\n		\'SELECT\'	=> \'e.id\',\n		\'FROM\'		=> \'extensions AS e\',\n		\'WHERE\'		=> \'e.disabled=0 AND e.dependencies LIKE \\\'%|\'.$forum_db->escape($ext_id).\'|%\\\'\'\n	);\n\n	($hook = get_hook(\'aex_qr_get_disable_dependencies\')) ? eval($hook) : null;\n	$result = $forum_db->query_build($query) or error(__FILE__, __LINE__);\n\n	if ($forum_db->num_rows($result) != 0)\n	{\n		$dependency = $forum_db->fetch_assoc($result);\n		$pun_repository_error = sprintf($lang_admin[\'Disable dependency\'], $dependency[\'id\']);\n	}\n\n	if ($pun_repository_error == \'\' && ($ext_id != $ext_info[\'id\']))\n	{\n		// Disable extension\n		$query = array(\n			\'UPDATE\'	=> \'extensions\',\n			\'SET\'		=> \'disabled=1\',\n			\'WHERE\'		=> \'id=\\\'\'.$forum_db->escape($ext_id).\'\\\'\'\n		);\n\n		($hook = get_hook(\'aex_qr_update_disabled_status\')) ? eval($hook) : null;\n		$forum_db->query_build($query) or error(__FILE__, __LINE__);\n\n		// Regenerate the hooks cache\n		require_once FORUM_ROOT.\'include/cache.php\';\n		generate_hooks_cache();\n	}\n\n	if ($pun_repository_error == \'\')\n	{\n		if ($ext_id == $ext_info[\'id\'])\n		{\n			// Hey! That\'s me!\n			// All the necessary files should be included before renaming old directory\n			// NOTE: Self-updating is to be tested more in real-life conditions\n			if (!defined(\'PUN_REPOSITORY_TAR_EXTRACT_INCLUDED\'))\n				require $ext_info[\'path\'].\'/pun_repository_tar_extract.php\';\n		}\n\n		// Rename old extension dir\n		if (is_writable(FORUM_ROOT.\'extensions/\'.$ext_id) && @rename(FORUM_ROOT.\'extensions/\'.$ext_id, FORUM_ROOT.\'extensions/\'.$ext_id.\'.old\'))\n			$pun_repository_error = pun_repository_download_extension($ext_id, $ext_data); // Download extension\n		else\n			$pun_repository_error = sprintf($lang_pun_repository[\'Unable to rename old dir\'], FORUM_ROOT.\'extensions/\'.$ext_id);\n	}\n\n	if ($pun_repository_error == \'\')\n	{\n		// Do we have extension data at all? :-)\n		if (empty($ext_data))\n			$errors = array(true);\n\n		// Validate manifest\n		if (empty($errors))\n			$errors = validate_manifest($ext_data, $ext_id);\n\n		if (!empty($errors))\n			$pun_repository_error = $lang_pun_repository[\'Incorrect manifest.xml\'];\n	}\n\n	if ($pun_repository_error == \'\')\n	{\n		($hook = get_hook(\'pun_repository_download_and_update_ok\')) ? eval($hook) : null;\n\n		// Everything is OK. Start installation.\n		pun_repository_rm_recursive(FORUM_ROOT.\'extensions/\'.$ext_id.\'.old\');\n		redirect($base_url.\'/admin/extensions.php?install=\'.urlencode($ext_id), $lang_pun_repository[\'Download successful\']);\n	}\n\n	($hook = get_hook(\'pun_repository_download_and_update_error\')) ? eval($hook) : null;\n\n	// Get old version back\n	@pun_repository_rm_recursive(FORUM_ROOT.\'extensions/\'.$ext_id);\n	@rename(FORUM_ROOT.\'extensions/\'.$ext_id.\'.old\', FORUM_ROOT.\'extensions/\'.$ext_id);\n\n	// Enable extension\n	$query = array(\n		\'UPDATE\'	=> \'extensions\',\n		\'SET\'		=> \'disabled=0\',\n		\'WHERE\'		=> \'id=\\\'\'.$forum_db->escape($ext_id).\'\\\'\'\n	);\n\n	($hook = get_hook(\'aex_qr_update_enabled_status\')) ? eval($hook) : null;\n	$forum_db->query_build($query) or error(__FILE__, __LINE__);\n\n	// Regenerate the hooks cache\n	require_once FORUM_ROOT.\'include/cache.php\';\n	generate_hooks_cache();\n\n	($hook = get_hook(\'pun_repository_download_and_update_end\')) ? eval($hook) : null;\n}\n\n// Do we have some error?\nif (!empty($pun_repository_error))\n{\n	// Setup breadcrumbs\n	$forum_page[\'crumbs\'] = array(\n		array($forum_config[\'o_board_title\'], forum_link($forum_url[\'index\'])),\n		array($lang_admin_common[\'Forum administration\'], forum_link($forum_url[\'admin_index\'])),\n		array($lang_admin_common[\'Extensions\'], forum_link($forum_url[\'admin_extensions_manage\'])),\n		array($lang_admin_common[\'Manage extensions\'], forum_link($forum_url[\'admin_extensions_manage\'])),\n		$lang_pun_repository[\'PunBB Repository\']\n	);\n\n	($hook = get_hook(\'pun_repository__pre_header_load\')) ? eval($hook) : null;\n\n	define(\'FORUM_PAGE_SECTION\', \'extensions\');\n	define(\'FORUM_PAGE\', \'admin-extensions-pun-repository\');\n	require FORUM_ROOT.\'header.php\';\n\n	// START SUBST - <!-- forum_main -->\n	ob_start();\n\n	($hook = get_hook(\'pun_repository_display_error_output_start\')) ? eval($hook) : null;\n\n?>\n	<div class=\"main-subhead\">\n		<h2 class=\"hn\"><span><?php echo $lang_pun_repository[\'PunBB Repository\'] ?></span></h2>\n	</div>\n	<div class=\"main-content\">\n		<div class=\"ct-box warn-box\">\n			<p class=\"warn\"><?php echo $pun_repository_error ?></p>\n		</div>\n	</div>\n<?php\n\n	($hook = get_hook(\'pun_repository_display_error_pre_ob_end\')) ? eval($hook) : null;\n\n	$tpl_temp = trim(ob_get_contents());\n	$tpl_main = str_replace(\'<!-- forum_main -->\', $tpl_temp, $tpl_main);\n	ob_end_clean();\n	// END SUBST - <!-- forum_main -->\n\n	require FORUM_ROOT.\'footer.php\';\n}',1362927424,5),('aex_section_manage_pre_header_load','pun_repository','if (file_exists($ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\'))\n	include $ext_info[\'path\'].\'/lang/\'.$forum_user[\'language\'].\'/pun_repository.php\';\nelse\n	include $ext_info[\'path\'].\'/lang/English/pun_repository.php\';\n\nrequire_once $ext_info[\'path\'].\'/pun_repository.php\';\n\nif (!defined(\'PUN_REPOSITORY_EXTENSIONS_LOADED\') && file_exists(FORUM_CACHE_DIR.\'cache_pun_repository.php\'))\n	include FORUM_CACHE_DIR.\'cache_pun_repository.php\';\n\nif (!defined(\'FORUM_EXT_VERSIONS_LOADED\') && file_exists(FORUM_CACHE_DIR.\'cache_ext_version_notifications.php\'))\n	include FORUM_CACHE_DIR.\'cache_ext_version_notifications.php\';\n\n// Regenerate cache only if automatic updates are enabled and if the cache is more than 12 hours old\nif (!defined(\'PUN_REPOSITORY_EXTENSIONS_LOADED\') || !defined(\'FORUM_EXT_VERSIONS_LOADED\') || ($pun_repository_extensions_timestamp < $forum_ext_versions_update_cache))\n{\n	if (pun_repository_generate_cache($pun_repository_error))\n		require FORUM_CACHE_DIR.\'cache_pun_repository.php\';\n}',1362927424,5),('aex_section_manage_pre_ext_actions','pun_repository','if (defined(\'PUN_REPOSITORY_EXTENSIONS_LOADED\') && isset($pun_repository_extensions[$id]) && version_compare($ext[\'version\'], $pun_repository_extensions[$id][\'version\'], \'<\') && is_writable(FORUM_ROOT.\'extensions/\'.$id))\n{\n	// Check for unresolved dependencies\n	if (isset($pun_repository_extensions[$id][\'dependencies\']))\n		$pun_repository_extensions[$id][\'dependencies\'] = pun_repository_check_dependencies($inst_exts, $pun_repository_extensions[$id][\'dependencies\']);\n\n	if (empty($pun_repository_extensions[$id][\'dependencies\'][\'unresolved\']))\n		$forum_page[\'ext_actions\'][] = \'<span><a href=\"\'.$base_url.\'/admin/extensions.php?pun_repository_download_and_update=\'.$id.\'&amp;csrf_token=\'.generate_form_token(\'pun_repository_download_and_update_\'.$id).\'\">\'.$lang_pun_repository[\'Download and update\'].\'</a></span>\';\n}',1362927424,5),('co_common','pun_repository','$pun_extensions_used = array_merge(isset($pun_extensions_used) ? $pun_extensions_used : array(), array($ext_info[\'id\']));',1362927424,5),('ft_about_end','pun_repository','if (!defined(\'PUN_EXTENSIONS_USED\') && !empty($pun_extensions_used))\n{\n	define(\'PUN_EXTENSIONS_USED\', 1);\n	if (count($pun_extensions_used) == 1)\n		echo \'<p style=\"clear: both; \">The \'.$pun_extensions_used[0].\' official extension is installed. Copyright &copy; 2003&ndash;2009 <a href=\"http://punbb.informer.com/\">PunBB</a>.</p>\';\n	else\n		echo \'<p style=\"clear: both; \">Currently installed <span id=\"extensions-used\" title=\"\'.implode(\', \', $pun_extensions_used).\'.\">\'.count($pun_extensions_used).\' official extensions</span>. Copyright &copy; 2003&ndash;2009 <a href=\"http://punbb.informer.com/\">PunBB</a>.</p>\';\n}',1362927424,9);
/*!40000 ALTER TABLE `extension_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(25) NOT NULL DEFAULT '',
  `description` text,
  `author` varchar(50) NOT NULL DEFAULT '',
  `uninstall` text,
  `uninstall_note` text,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `dependencies` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
INSERT INTO `extensions` VALUES ('pun_repository','PunBB Repository','1.2.2','Feel free to download and install extensions from PunBB repository.','PunBB Development Team',NULL,NULL,0,'||');
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_perms`
--

DROP TABLE IF EXISTS `forum_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_perms` (
  `group_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `read_forum` tinyint(1) NOT NULL DEFAULT '1',
  `post_replies` tinyint(1) NOT NULL DEFAULT '1',
  `post_topics` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_perms`
--

LOCK TABLES `forum_perms` WRITE;
/*!40000 ALTER TABLE `forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(80) NOT NULL DEFAULT 'New forum',
  `forum_desc` text,
  `redirect_url` varchar(100) DEFAULT NULL,
  `moderators` text,
  `num_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_post` int(10) unsigned DEFAULT NULL,
  `last_post_id` int(10) unsigned DEFAULT NULL,
  `last_poster` varchar(200) DEFAULT NULL,
  `sort_by` tinyint(1) NOT NULL DEFAULT '0',
  `disp_position` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,'Test forum','This is just a test forum',NULL,NULL,1,1,1362927424,1,'admin',0,1,1);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `g_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_title` varchar(50) NOT NULL DEFAULT '',
  `g_user_title` varchar(50) DEFAULT NULL,
  `g_moderator` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_edit_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_rename_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_change_passwords` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_ban_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_read_board` tinyint(1) NOT NULL DEFAULT '1',
  `g_view_users` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_replies` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_topics` tinyint(1) NOT NULL DEFAULT '1',
  `g_edit_posts` tinyint(1) NOT NULL DEFAULT '1',
  `g_delete_posts` tinyint(1) NOT NULL DEFAULT '1',
  `g_delete_topics` tinyint(1) NOT NULL DEFAULT '1',
  `g_set_title` tinyint(1) NOT NULL DEFAULT '1',
  `g_search` tinyint(1) NOT NULL DEFAULT '1',
  `g_search_users` tinyint(1) NOT NULL DEFAULT '1',
  `g_send_email` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_flood` smallint(6) NOT NULL DEFAULT '30',
  `g_search_flood` smallint(6) NOT NULL DEFAULT '30',
  `g_email_flood` smallint(6) NOT NULL DEFAULT '60',
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Administrators','Administrator',0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0),(2,'Guest',NULL,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,60,30,0),(3,'Members',NULL,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,60,30,60),(4,'Moderators','Moderator',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online`
--

DROP TABLE IF EXISTS `online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `ident` varchar(200) NOT NULL DEFAULT '',
  `logged` int(10) unsigned NOT NULL DEFAULT '0',
  `idle` tinyint(1) NOT NULL DEFAULT '0',
  `csrf_token` varchar(40) NOT NULL DEFAULT '',
  `prev_url` varchar(255) DEFAULT NULL,
  `last_post` int(10) unsigned DEFAULT NULL,
  `last_search` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `online_user_id_ident_idx` (`user_id`,`ident`(25)),
  KEY `online_ident_idx` (`ident`(25)),
  KEY `online_logged_idx` (`logged`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online`
--

LOCK TABLES `online` WRITE;
/*!40000 ALTER TABLE `online` DISABLE KEYS */;
/*!40000 ALTER TABLE `online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` varchar(200) NOT NULL DEFAULT '',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '1',
  `poster_ip` varchar(39) DEFAULT NULL,
  `poster_email` varchar(80) DEFAULT NULL,
  `message` text,
  `hide_smilies` tinyint(1) NOT NULL DEFAULT '0',
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_by` varchar(200) DEFAULT NULL,
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_topic_id_idx` (`topic_id`),
  KEY `posts_multi_idx` (`poster_id`,`topic_id`),
  KEY `posts_posted_idx` (`posted`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'admin',2,'127.0.0.1',NULL,'If you are looking at this (which I guess you are), the install of PunBB appears to have worked! Now log in and head over to the administration control panel to configure your forum.',0,1362927424,NULL,NULL,1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL DEFAULT '',
  `min_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'New member',0),(2,'Member',10);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reported_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text,
  `zapped` int(10) unsigned DEFAULT NULL,
  `zapped_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_zapped_idx` (`zapped`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_cache`
--

DROP TABLE IF EXISTS `search_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_cache` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `ident` varchar(200) NOT NULL DEFAULT '',
  `search_data` text,
  PRIMARY KEY (`id`),
  KEY `search_cache_ident_idx` (`ident`(8))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_cache`
--

LOCK TABLES `search_cache` WRITE;
/*!40000 ALTER TABLE `search_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_matches`
--

DROP TABLE IF EXISTS `search_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_matches` (
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_match` tinyint(1) NOT NULL DEFAULT '0',
  KEY `search_matches_word_id_idx` (`word_id`),
  KEY `search_matches_post_id_idx` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_matches`
--

LOCK TABLES `search_matches` WRITE;
/*!40000 ALTER TABLE `search_matches` DISABLE KEYS */;
INSERT INTO `search_matches` VALUES (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(1,11,0),(1,12,0),(1,13,0),(1,14,0),(1,15,0),(1,16,0),(1,17,0),(1,18,0),(1,19,0),(1,20,0),(1,21,0),(1,22,0),(1,23,0),(1,25,1),(1,24,1);
/*!40000 ALTER TABLE `search_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_words`
--

DROP TABLE IF EXISTS `search_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`word`),
  KEY `search_words_id_idx` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_words`
--

LOCK TABLES `search_words` WRITE;
/*!40000 ALTER TABLE `search_words` DISABLE KEYS */;
INSERT INTO `search_words` VALUES (1,'you'),(2,'are'),(3,'looking'),(4,'this'),(5,'which'),(6,'guess'),(7,'the'),(8,'install'),(9,'punbb'),(10,'appears'),(11,'have'),(12,'worked'),(13,'now'),(14,'log'),(15,'and'),(16,'head'),(17,'over'),(18,'administration'),(19,'control'),(20,'panel'),(21,'configure'),(22,'your'),(23,'forum'),(24,'test'),(25,'post');
/*!40000 ALTER TABLE `search_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` varchar(200) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `first_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_poster` varchar(200) DEFAULT NULL,
  `num_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `moved_to` int(10) unsigned DEFAULT NULL,
  `forum_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `topics_forum_id_idx` (`forum_id`),
  KEY `topics_moved_to_idx` (`moved_to`),
  KEY `topics_last_post_idx` (`last_post`),
  KEY `topics_first_post_id_idx` (`first_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'admin','Test post',1362927424,1,1362927424,1,'admin',0,0,0,0,NULL,1);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '3',
  `username` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(12) DEFAULT NULL,
  `email` varchar(80) NOT NULL DEFAULT '',
  `title` varchar(50) DEFAULT NULL,
  `realname` varchar(40) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `jabber` varchar(80) DEFAULT NULL,
  `icq` varchar(12) DEFAULT NULL,
  `msn` varchar(80) DEFAULT NULL,
  `aim` varchar(30) DEFAULT NULL,
  `yahoo` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `signature` text,
  `disp_topics` tinyint(3) unsigned DEFAULT NULL,
  `disp_posts` tinyint(3) unsigned DEFAULT NULL,
  `email_setting` tinyint(1) NOT NULL DEFAULT '1',
  `notify_with_post` tinyint(1) NOT NULL DEFAULT '0',
  `auto_notify` tinyint(1) NOT NULL DEFAULT '0',
  `show_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `show_img` tinyint(1) NOT NULL DEFAULT '1',
  `show_img_sig` tinyint(1) NOT NULL DEFAULT '1',
  `show_avatars` tinyint(1) NOT NULL DEFAULT '1',
  `show_sig` tinyint(1) NOT NULL DEFAULT '1',
  `access_keys` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` float NOT NULL DEFAULT '0',
  `dst` tinyint(1) NOT NULL DEFAULT '0',
  `time_format` int(10) unsigned NOT NULL DEFAULT '0',
  `date_format` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(25) NOT NULL DEFAULT 'English',
  `style` varchar(25) NOT NULL DEFAULT 'Oxygen',
  `num_posts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post` int(10) unsigned DEFAULT NULL,
  `last_search` int(10) unsigned DEFAULT NULL,
  `last_email_sent` int(10) unsigned DEFAULT NULL,
  `registered` int(10) unsigned NOT NULL DEFAULT '0',
  `registration_ip` varchar(39) NOT NULL DEFAULT '0.0.0.0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_note` varchar(30) DEFAULT NULL,
  `activate_string` varchar(80) DEFAULT NULL,
  `activate_key` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_registered_idx` (`registered`),
  KEY `users_username_idx` (`username`(8))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'Guest','Guest',NULL,'Guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,1,1,1,1,1,0,0,0,0,0,'English','Oxygen',0,NULL,NULL,NULL,0,'0.0.0.0',0,NULL,NULL,NULL),(2,1,'admin','703d0acec686cffc10192cdf61c1b1426a615e7b','{Q)iIa`NXkD?','webcie@karpenoktem.nl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,1,1,1,1,1,0,0,0,0,0,'English','Oxygen',1,1362927424,NULL,NULL,1362927424,'127.0.0.1',1362927424,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-10 15:07:53
