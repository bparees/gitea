/*Generated by xorm v0.7.0.0504 2019-09-16 03:11:59, from sqlite3 to SQLITE3*/

CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `lower_name` TEXT NOT NULL, `name` TEXT NOT NULL, `full_name` TEXT NULL, `email` TEXT NOT NULL, `keep_email_private` INTEGER NULL, `email_notifications_preference` TEXT DEFAULT 'enabled' NOT NULL, `passwd` TEXT NOT NULL, `passwd_hash_algo` TEXT DEFAULT 'pbkdf2' NOT NULL, `must_change_password` INTEGER DEFAULT 0 NOT NULL, `login_type` INTEGER NULL, `login_source` INTEGER DEFAULT 0 NOT NULL, `login_name` TEXT NULL, `type` INTEGER NULL, `location` TEXT NULL, `website` TEXT NULL, `rands` TEXT NULL, `salt` TEXT NULL, `language` TEXT NULL, `description` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL, `last_login_unix` INTEGER NULL, `last_repo_visibility` INTEGER NULL, `max_repo_creation` INTEGER DEFAULT -1 NOT NULL, `is_active` INTEGER NULL, `is_admin` INTEGER NULL, `allow_git_hook` INTEGER NULL, `allow_import_local` INTEGER NULL, `allow_create_organization` INTEGER DEFAULT 1 NULL, `prohibit_login` INTEGER DEFAULT 0 NOT NULL, `avatar` TEXT NOT NULL, `avatar_email` TEXT NOT NULL, `use_custom_avatar` INTEGER NULL, `num_followers` INTEGER NULL, `num_following` INTEGER DEFAULT 0 NOT NULL, `num_stars` INTEGER NULL, `num_repos` INTEGER NULL, `num_teams` INTEGER NULL, `num_members` INTEGER NULL, `visibility` INTEGER DEFAULT 0 NOT NULL, `diff_view_style` TEXT DEFAULT '' NOT NULL, `theme` TEXT DEFAULT '' NOT NULL);
CREATE INDEX `IDX_user_last_login_unix` ON `user` (`last_login_unix`);
CREATE INDEX `IDX_user_is_active` ON `user` (`is_active`);
CREATE UNIQUE INDEX `UQE_user_lower_name` ON `user` (`lower_name`);
CREATE UNIQUE INDEX `UQE_user_name` ON `user` (`name`);
CREATE INDEX `IDX_user_created_unix` ON `user` (`created_unix`);
CREATE INDEX `IDX_user_updated_unix` ON `user` (`updated_unix`);
INSERT INTO `user` (`id`, `lower_name`, `name`, `full_name`, `email`, `keep_email_private`, `email_notifications_preference`, `passwd`, `passwd_hash_algo`, `must_change_password`, `login_type`, `login_source`, `login_name`, `type`, `location`, `website`, `rands`, `salt`, `language`, `description`, `created_unix`, `updated_unix`, `last_login_unix`, `last_repo_visibility`, `max_repo_creation`, `is_active`, `is_admin`, `allow_git_hook`, `allow_import_local`, `allow_create_organization`, `prohibit_login`, `avatar`, `avatar_email`, `use_custom_avatar`, `num_followers`, `num_following`, `num_stars`, `num_repos`, `num_teams`, `num_members`, `visibility`, `diff_view_style`, `theme`) VALUES (1, 'admin1', 'admin1', '', 'admin@admin.com', false, 'enabled', 'e4ca6e5143fd6cba58919f666eaf2c2a6ef1432f8fa76f082d5df1aa2e8ead0b9e6449b684f2277c845c9fd696b7514d793e', 'pbkdf2', false, 0, 0, '', 0, '', '', '3vvTMaqJGG', 'U89fbykmqj', 'en-US', '', 1568603185, 1568603236, 1568603185, true, -1, true, true, false, false, true, false, '64e1b8d34f425d19e1ee2ea7236d3028', 'admin@admin.com', false, 0, 0, 0, 1, 0, 0, 0, '', 'gitea');

CREATE TABLE IF NOT EXISTS `public_key` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `owner_id` INTEGER NOT NULL, `name` TEXT NOT NULL, `fingerprint` TEXT NOT NULL, `content` TEXT NOT NULL, `mode` INTEGER DEFAULT 2 NOT NULL, `type` INTEGER DEFAULT 1 NOT NULL, `login_source_id` INTEGER DEFAULT 0 NOT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_public_key_owner_id` ON `public_key` (`owner_id`);
CREATE INDEX `IDX_public_key_fingerprint` ON `public_key` (`fingerprint`);
INSERT INTO `public_key` (`id`, `owner_id`, `name`, `fingerprint`, `content`, `mode`, `type`, `login_source_id`, `created_unix`, `updated_unix`) VALUES (1, 1, 'bparees@thinkpad', 'SHA256:RZmjnRbycRyzkl47PhL3XKMoUvhOR6ND+wnzmoa0tPo', 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiRy7tb+apaP2P2eVWFNPwccIG9E7apPcPSjfD7zNA3hZA5D+7tK3aumB2jPEYCabIhTPuJSYKt4PIbnvrerzZk8MbWyqI8sThpkHY8eZEAeNBlfc/q36wt1mZa/nMXAOAFq5l+T+0N00Or/19jpXsuK8shiMJAL4Ua5+lIRcAL1PbqVSHnxy+MNb3hkLVFVgyxnfr79ZQz83YfFJZQN92ocBc1bJZjSOqG5aCvRW8pIqF/w0QCfdUKAVDuXYyyAkOenlZCuOmp0TmupAcbqfUGngj07PEhOPARQXVFrRSgH2UqL/rTQpif1Z6vW+L6hW/S5ZRQMWM7G4tJ2qdXUs4DDToSaUNqnJRfjtNTgqOESN7/YBG/ScoiOZbOw3qcm+FS0+57pYT+ThveJzV/iL1Fc4d3iclmkiXTFluBk8Pm2CHq3RxSpyBjC41SHD54eTCr529MJAP5mavxUXeSv+rlfRuFa2iut9PYG82zox2qw52rnhQHXlyVAE9VR1wdSE= bparees@thinkpad', 2, 1, 0, 1568603217, 1568603217);

CREATE TABLE IF NOT EXISTS `access_token` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NULL, `name` TEXT NULL, `token_hash` TEXT NULL, `token_salt` TEXT NULL, `token_last_eight` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_access_token_uid` ON `access_token` (`uid`);
CREATE UNIQUE INDEX `UQE_access_token_token_hash` ON `access_token` (`token_hash`);
CREATE INDEX `IDX_access_token_created_unix` ON `access_token` (`created_unix`);
CREATE INDEX `IDX_access_token_updated_unix` ON `access_token` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `repository` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `owner_id` INTEGER NULL, `lower_name` TEXT NOT NULL, `name` TEXT NOT NULL, `description` TEXT NULL, `website` TEXT NULL, `original_url` TEXT NULL, `default_branch` TEXT NULL, `num_watches` INTEGER NULL, `num_stars` INTEGER NULL, `num_forks` INTEGER NULL, `num_issues` INTEGER NULL, `num_closed_issues` INTEGER NULL, `num_pulls` INTEGER NULL, `num_closed_pulls` INTEGER NULL, `num_milestones` INTEGER DEFAULT 0 NOT NULL, `num_closed_milestones` INTEGER DEFAULT 0 NOT NULL, `is_private` INTEGER NULL, `is_empty` INTEGER NULL, `is_archived` INTEGER NULL, `is_mirror` INTEGER NULL, `is_fork` INTEGER DEFAULT 0 NOT NULL, `fork_id` INTEGER NULL, `size` INTEGER DEFAULT 0 NOT NULL, `is_fsck_enabled` INTEGER DEFAULT 1 NOT NULL, `close_issues_via_commit_in_any_branch` INTEGER DEFAULT 0 NOT NULL, `topics` TEXT NULL, `avatar` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_repository_created_unix` ON `repository` (`created_unix`);
CREATE INDEX `IDX_repository_updated_unix` ON `repository` (`updated_unix`);
CREATE INDEX `IDX_repository_lower_name` ON `repository` (`lower_name`);
CREATE INDEX `IDX_repository_is_empty` ON `repository` (`is_empty`);
CREATE INDEX `IDX_repository_is_archived` ON `repository` (`is_archived`);
CREATE INDEX `IDX_repository_is_mirror` ON `repository` (`is_mirror`);
CREATE INDEX `IDX_repository_is_fork` ON `repository` (`is_fork`);
CREATE INDEX `IDX_repository_fork_id` ON `repository` (`fork_id`);
CREATE UNIQUE INDEX `UQE_repository_s` ON `repository` (`owner_id`,`lower_name`);
CREATE INDEX `IDX_repository_owner_id` ON `repository` (`owner_id`);
CREATE INDEX `IDX_repository_name` ON `repository` (`name`);
CREATE INDEX `IDX_repository_is_private` ON `repository` (`is_private`);
INSERT INTO `repository` (`id`, `owner_id`, `lower_name`, `name`, `description`, `website`, `original_url`, `default_branch`, `num_watches`, `num_stars`, `num_forks`, `num_issues`, `num_closed_issues`, `num_pulls`, `num_closed_pulls`, `num_milestones`, `num_closed_milestones`, `is_private`, `is_empty`, `is_archived`, `is_mirror`, `is_fork`, `fork_id`, `size`, `is_fsck_enabled`, `close_issues_via_commit_in_any_branch`, `topics`, `avatar`, `created_unix`, `updated_unix`) VALUES (1, 1, 'test', 'test', '', '', '', 'master', 1, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, false, false, 0, 0, true, false, 'null', '', 1568603236, 1568603236);

CREATE TABLE IF NOT EXISTS `deploy_key` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `key_id` INTEGER NULL, `repo_id` INTEGER NULL, `name` TEXT NULL, `fingerprint` TEXT NULL, `mode` INTEGER DEFAULT 1 NOT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_deploy_key_key_id` ON `deploy_key` (`key_id`);
CREATE UNIQUE INDEX `UQE_deploy_key_s` ON `deploy_key` (`key_id`,`repo_id`);
CREATE INDEX `IDX_deploy_key_repo_id` ON `deploy_key` (`repo_id`);

CREATE TABLE IF NOT EXISTS `collaboration` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `mode` INTEGER DEFAULT 2 NOT NULL);
CREATE UNIQUE INDEX `UQE_collaboration_s` ON `collaboration` (`repo_id`,`user_id`);
CREATE INDEX `IDX_collaboration_repo_id` ON `collaboration` (`repo_id`);
CREATE INDEX `IDX_collaboration_user_id` ON `collaboration` (`user_id`);

CREATE TABLE IF NOT EXISTS `access` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NULL, `repo_id` INTEGER NULL, `mode` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_access_s` ON `access` (`user_id`,`repo_id`);

CREATE TABLE IF NOT EXISTS `upload` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uuid` UUID NULL, `name` TEXT NULL);
CREATE UNIQUE INDEX `UQE_upload_uuid` ON `upload` (`uuid`);

CREATE TABLE IF NOT EXISTS `watch` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NULL, `repo_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_watch_watch` ON `watch` (`user_id`,`repo_id`);
INSERT INTO `watch` (`id`, `user_id`, `repo_id`) VALUES (1, 1, 1);

CREATE TABLE IF NOT EXISTS `star` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NULL, `repo_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_star_s` ON `star` (`uid`,`repo_id`);

CREATE TABLE IF NOT EXISTS `follow` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NULL, `follow_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_follow_follow` ON `follow` (`user_id`,`follow_id`);

CREATE TABLE IF NOT EXISTS `action` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NULL, `op_type` INTEGER NULL, `act_user_id` INTEGER NULL, `repo_id` INTEGER NULL, `comment_id` INTEGER NULL, `is_deleted` INTEGER DEFAULT 0 NOT NULL, `ref_name` TEXT NULL, `is_private` INTEGER DEFAULT 0 NOT NULL, `content` TEXT NULL, `created_unix` INTEGER NULL);
CREATE INDEX `IDX_action_created_unix` ON `action` (`created_unix`);
CREATE INDEX `IDX_action_user_id` ON `action` (`user_id`);
CREATE INDEX `IDX_action_act_user_id` ON `action` (`act_user_id`);
CREATE INDEX `IDX_action_repo_id` ON `action` (`repo_id`);
CREATE INDEX `IDX_action_comment_id` ON `action` (`comment_id`);
CREATE INDEX `IDX_action_is_deleted` ON `action` (`is_deleted`);
CREATE INDEX `IDX_action_is_private` ON `action` (`is_private`);
INSERT INTO `action` (`id`, `user_id`, `op_type`, `act_user_id`, `repo_id`, `comment_id`, `is_deleted`, `ref_name`, `is_private`, `content`, `created_unix`) VALUES (1, 1, 1, 1, 1, 0, false, '', true, '', 1568603236);

CREATE TABLE IF NOT EXISTS `issue` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `index` INTEGER NULL, `poster_id` INTEGER NULL, `original_author` TEXT NULL, `original_author_id` INTEGER NULL, `name` TEXT NULL, `content` TEXT NULL, `milestone_id` INTEGER NULL, `priority` INTEGER NULL, `is_closed` INTEGER NULL, `is_pull` INTEGER NULL, `num_comments` INTEGER NULL, `ref` TEXT NULL, `deadline_unix` INTEGER NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL, `closed_unix` INTEGER NULL, `is_locked` INTEGER DEFAULT 0 NOT NULL);
CREATE INDEX `IDX_issue_repo_id` ON `issue` (`repo_id`);
CREATE INDEX `IDX_issue_poster_id` ON `issue` (`poster_id`);
CREATE INDEX `IDX_issue_is_closed` ON `issue` (`is_closed`);
CREATE INDEX `IDX_issue_updated_unix` ON `issue` (`updated_unix`);
CREATE UNIQUE INDEX `UQE_issue_repo_index` ON `issue` (`repo_id`,`index`);
CREATE INDEX `IDX_issue_is_pull` ON `issue` (`is_pull`);
CREATE INDEX `IDX_issue_deadline_unix` ON `issue` (`deadline_unix`);
CREATE INDEX `IDX_issue_created_unix` ON `issue` (`created_unix`);
CREATE INDEX `IDX_issue_closed_unix` ON `issue` (`closed_unix`);
CREATE INDEX `IDX_issue_milestone_id` ON `issue` (`milestone_id`);

CREATE TABLE IF NOT EXISTS `pull_request` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` INTEGER NULL, `status` INTEGER NULL, `conflicted_files` TEXT NULL, `issue_id` INTEGER NULL, `index` INTEGER NULL, `head_repo_id` INTEGER NULL, `base_repo_id` INTEGER NULL, `head_user_name` TEXT NULL, `head_branch` TEXT NULL, `base_branch` TEXT NULL, `merge_base` TEXT NULL, `has_merged` INTEGER NULL, `merged_commit_id` TEXT NULL, `merger_id` INTEGER NULL, `merged_unix` INTEGER NULL);
CREATE INDEX `IDX_pull_request_merged_unix` ON `pull_request` (`merged_unix`);
CREATE INDEX `IDX_pull_request_issue_id` ON `pull_request` (`issue_id`);
CREATE INDEX `IDX_pull_request_head_repo_id` ON `pull_request` (`head_repo_id`);
CREATE INDEX `IDX_pull_request_base_repo_id` ON `pull_request` (`base_repo_id`);
CREATE INDEX `IDX_pull_request_has_merged` ON `pull_request` (`has_merged`);
CREATE INDEX `IDX_pull_request_merger_id` ON `pull_request` (`merger_id`);

CREATE TABLE IF NOT EXISTS `comment` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` INTEGER NULL, `poster_id` INTEGER NULL, `original_author` TEXT NULL, `original_author_id` INTEGER NULL, `issue_id` INTEGER NULL, `label_id` INTEGER NULL, `old_milestone_id` INTEGER NULL, `milestone_id` INTEGER NULL, `assignee_id` INTEGER NULL, `removed_assignee` INTEGER NULL, `old_title` TEXT NULL, `new_title` TEXT NULL, `dependent_issue_id` INTEGER NULL, `commit_id` INTEGER NULL, `line` INTEGER NULL, `tree_path` TEXT NULL, `content` TEXT NULL, `patch` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL, `commit_sha` TEXT NULL, `review_id` INTEGER NULL, `invalidated` INTEGER NULL);
CREATE INDEX `IDX_comment_issue_id` ON `comment` (`issue_id`);
CREATE INDEX `IDX_comment_created_unix` ON `comment` (`created_unix`);
CREATE INDEX `IDX_comment_updated_unix` ON `comment` (`updated_unix`);
CREATE INDEX `IDX_comment_review_id` ON `comment` (`review_id`);
CREATE INDEX `IDX_comment_type` ON `comment` (`type`);
CREATE INDEX `IDX_comment_poster_id` ON `comment` (`poster_id`);

CREATE TABLE IF NOT EXISTS `attachment` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uuid` UUID NULL, `issue_id` INTEGER NULL, `release_id` INTEGER NULL, `uploader_id` INTEGER DEFAULT 0 NULL, `comment_id` INTEGER NULL, `name` TEXT NULL, `download_count` INTEGER DEFAULT 0 NULL, `size` INTEGER DEFAULT 0 NULL, `created_unix` INTEGER NULL);
CREATE INDEX `IDX_attachment_release_id` ON `attachment` (`release_id`);
CREATE INDEX `IDX_attachment_uploader_id` ON `attachment` (`uploader_id`);
CREATE UNIQUE INDEX `UQE_attachment_uuid` ON `attachment` (`uuid`);
CREATE INDEX `IDX_attachment_issue_id` ON `attachment` (`issue_id`);

CREATE TABLE IF NOT EXISTS `label` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `name` TEXT NULL, `description` TEXT NULL, `color` TEXT NULL, `num_issues` INTEGER NULL, `num_closed_issues` INTEGER NULL, `query_string` TEXT NULL, `is_selected` INTEGER NULL);
CREATE INDEX `IDX_label_repo_id` ON `label` (`repo_id`);

CREATE TABLE IF NOT EXISTS `issue_label` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `issue_id` INTEGER NULL, `label_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_issue_label_s` ON `issue_label` (`issue_id`,`label_id`);

CREATE TABLE IF NOT EXISTS `milestone` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `name` TEXT NULL, `content` TEXT NULL, `is_closed` INTEGER NULL, `num_issues` INTEGER NULL, `num_closed_issues` INTEGER NULL, `completeness` INTEGER NULL, `deadline_unix` INTEGER NULL, `closed_date_unix` INTEGER NULL);
CREATE INDEX `IDX_milestone_repo_id` ON `milestone` (`repo_id`);

CREATE TABLE IF NOT EXISTS `mirror` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `interval` INTEGER NULL, `enable_prune` INTEGER DEFAULT 1 NOT NULL, `updated_unix` INTEGER NULL, `next_update_unix` INTEGER NULL);
CREATE INDEX `IDX_mirror_next_update_unix` ON `mirror` (`next_update_unix`);
CREATE INDEX `IDX_mirror_repo_id` ON `mirror` (`repo_id`);
CREATE INDEX `IDX_mirror_updated_unix` ON `mirror` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `release` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `publisher_id` INTEGER NULL, `tag_name` TEXT NULL, `lower_tag_name` TEXT NULL, `target` TEXT NULL, `title` TEXT NULL, `sha1` TEXT NULL, `num_commits` INTEGER NULL, `note` TEXT NULL, `is_draft` INTEGER DEFAULT 0 NOT NULL, `is_prerelease` INTEGER DEFAULT 0 NOT NULL, `is_tag` INTEGER DEFAULT 0 NOT NULL, `created_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_release_n` ON `release` (`repo_id`,`tag_name`);
CREATE INDEX `IDX_release_repo_id` ON `release` (`repo_id`);
CREATE INDEX `IDX_release_publisher_id` ON `release` (`publisher_id`);
CREATE INDEX `IDX_release_tag_name` ON `release` (`tag_name`);
CREATE INDEX `IDX_release_created_unix` ON `release` (`created_unix`);

CREATE TABLE IF NOT EXISTS `login_source` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` INTEGER NULL, `name` TEXT NULL, `is_actived` INTEGER DEFAULT 0 NOT NULL, `is_sync_enabled` INTEGER DEFAULT 0 NOT NULL, `cfg` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_login_source_name` ON `login_source` (`name`);
CREATE INDEX `IDX_login_source_is_actived` ON `login_source` (`is_actived`);
CREATE INDEX `IDX_login_source_is_sync_enabled` ON `login_source` (`is_sync_enabled`);
CREATE INDEX `IDX_login_source_created_unix` ON `login_source` (`created_unix`);
CREATE INDEX `IDX_login_source_updated_unix` ON `login_source` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `webhook` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `org_id` INTEGER NULL, `url` TEXT NULL, `signature` TEXT NULL, `http_method` TEXT NULL, `content_type` INTEGER NULL, `secret` TEXT NULL, `events` TEXT NULL, `is_ssl` INTEGER NULL, `is_active` INTEGER NULL, `hook_task_type` INTEGER NULL, `meta` TEXT NULL, `last_status` INTEGER NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_webhook_created_unix` ON `webhook` (`created_unix`);
CREATE INDEX `IDX_webhook_updated_unix` ON `webhook` (`updated_unix`);
CREATE INDEX `IDX_webhook_repo_id` ON `webhook` (`repo_id`);
CREATE INDEX `IDX_webhook_org_id` ON `webhook` (`org_id`);
CREATE INDEX `IDX_webhook_is_active` ON `webhook` (`is_active`);

CREATE TABLE IF NOT EXISTS `hook_task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `hook_id` INTEGER NULL, `uuid` TEXT NULL, `type` INTEGER NULL, `url` TEXT NULL, `signature` TEXT NULL, `payload_content` TEXT NULL, `http_method` TEXT NULL, `content_type` INTEGER NULL, `event_type` TEXT NULL, `is_ssl` INTEGER NULL, `is_delivered` INTEGER NULL, `delivered` INTEGER NULL, `is_succeed` INTEGER NULL, `request_content` TEXT NULL, `response_content` TEXT NULL);
CREATE INDEX `IDX_hook_task_repo_id` ON `hook_task` (`repo_id`);

CREATE TABLE IF NOT EXISTS `team` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `org_id` INTEGER NULL, `lower_name` TEXT NULL, `name` TEXT NULL, `description` TEXT NULL, `authorize` INTEGER NULL, `num_repos` INTEGER NULL, `num_members` INTEGER NULL);
CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);

CREATE TABLE IF NOT EXISTS `org_user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NULL, `org_id` INTEGER NULL, `is_public` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_org_user_s` ON `org_user` (`uid`,`org_id`);
CREATE INDEX `IDX_org_user_uid` ON `org_user` (`uid`);
CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);
CREATE INDEX `IDX_org_user_is_public` ON `org_user` (`is_public`);

CREATE TABLE IF NOT EXISTS `team_user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `org_id` INTEGER NULL, `team_id` INTEGER NULL, `uid` INTEGER NULL);
CREATE INDEX `IDX_team_user_org_id` ON `team_user` (`org_id`);
CREATE UNIQUE INDEX `UQE_team_user_s` ON `team_user` (`team_id`,`uid`);

CREATE TABLE IF NOT EXISTS `team_repo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `org_id` INTEGER NULL, `team_id` INTEGER NULL, `repo_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_team_repo_s` ON `team_repo` (`team_id`,`repo_id`);
CREATE INDEX `IDX_team_repo_org_id` ON `team_repo` (`org_id`);

CREATE TABLE IF NOT EXISTS `notice` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` INTEGER NULL, `description` TEXT NULL, `created_unix` INTEGER NULL);
CREATE INDEX `IDX_notice_created_unix` ON `notice` (`created_unix`);
INSERT INTO `notice` (`id`, `type`, `description`, `created_unix`) VALUES (1, 1, 'Error while getting .editorconfig file: reference not found', 1568603236);

CREATE TABLE IF NOT EXISTS `email_address` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NOT NULL, `email` TEXT NOT NULL, `is_activated` INTEGER NULL);
CREATE INDEX `IDX_email_address_uid` ON `email_address` (`uid`);
CREATE UNIQUE INDEX `UQE_email_address_email` ON `email_address` (`email`);

CREATE TABLE IF NOT EXISTS `notification` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NOT NULL, `repo_id` INTEGER NOT NULL, `status` INTEGER NOT NULL, `source` INTEGER NOT NULL, `issue_id` INTEGER NOT NULL, `commit_id` TEXT NULL, `updated_by` INTEGER NOT NULL, `created_unix` INTEGER NOT NULL, `updated_unix` INTEGER NOT NULL);
CREATE INDEX `IDX_notification_source` ON `notification` (`source`);
CREATE INDEX `IDX_notification_issue_id` ON `notification` (`issue_id`);
CREATE INDEX `IDX_notification_created_unix` ON `notification` (`created_unix`);
CREATE INDEX `IDX_notification_user_id` ON `notification` (`user_id`);
CREATE INDEX `IDX_notification_repo_id` ON `notification` (`repo_id`);
CREATE INDEX `IDX_notification_status` ON `notification` (`status`);
CREATE INDEX `IDX_notification_commit_id` ON `notification` (`commit_id`);
CREATE INDEX `IDX_notification_updated_by` ON `notification` (`updated_by`);
CREATE INDEX `IDX_notification_updated_unix` ON `notification` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `issue_user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NULL, `issue_id` INTEGER NULL, `is_read` INTEGER NULL, `is_mentioned` INTEGER NULL);
CREATE INDEX `IDX_issue_user_uid` ON `issue_user` (`uid`);

CREATE TABLE IF NOT EXISTS `lfs_meta_object` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `oid` TEXT NOT NULL, `size` INTEGER NOT NULL, `repository_id` INTEGER NOT NULL, `created_unix` INTEGER NULL);
CREATE INDEX `IDX_lfs_meta_object_repository_id` ON `lfs_meta_object` (`repository_id`);
CREATE UNIQUE INDEX `UQE_lfs_meta_object_s` ON `lfs_meta_object` (`oid`,`repository_id`);
CREATE INDEX `IDX_lfs_meta_object_oid` ON `lfs_meta_object` (`oid`);

CREATE TABLE IF NOT EXISTS `two_factor` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NULL, `secret` TEXT NULL, `scratch_salt` TEXT NULL, `scratch_hash` TEXT NULL, `last_used_passcode` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_two_factor_uid` ON `two_factor` (`uid`);
CREATE INDEX `IDX_two_factor_created_unix` ON `two_factor` (`created_unix`);
CREATE INDEX `IDX_two_factor_updated_unix` ON `two_factor` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `gpg_key` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `owner_id` INTEGER NOT NULL, `key_id` TEXT NOT NULL, `primary_key_id` TEXT NULL, `content` TEXT NOT NULL, `created_unix` INTEGER NULL, `expired_unix` INTEGER NULL, `added_unix` INTEGER NULL, `emails` TEXT NULL, `can_sign` INTEGER NULL, `can_encrypt_comms` INTEGER NULL, `can_encrypt_storage` INTEGER NULL, `can_certify` INTEGER NULL);
CREATE INDEX `IDX_gpg_key_owner_id` ON `gpg_key` (`owner_id`);
CREATE INDEX `IDX_gpg_key_key_id` ON `gpg_key` (`key_id`);

CREATE TABLE IF NOT EXISTS `gpg_key_import` (`key_id` TEXT PRIMARY KEY NOT NULL, `content` TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS `repo_unit` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `type` INTEGER NULL, `config` TEXT NULL, `created_unix` INTEGER NULL);
CREATE INDEX `IDX_repo_unit_s` ON `repo_unit` (`repo_id`,`type`);
CREATE INDEX `IDX_repo_unit_created_unix` ON `repo_unit` (`created_unix`);
INSERT INTO `repo_unit` (`id`, `repo_id`, `type`, `config`, `created_unix`) VALUES (1, 1, 1, NULL, 1568603236);
INSERT INTO `repo_unit` (`id`, `repo_id`, `type`, `config`, `created_unix`) VALUES (2, 1, 2, '{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}', 1568603236);
INSERT INTO `repo_unit` (`id`, `repo_id`, `type`, `config`, `created_unix`) VALUES (3, 1, 3, '{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true}', 1568603236);
INSERT INTO `repo_unit` (`id`, `repo_id`, `type`, `config`, `created_unix`) VALUES (4, 1, 4, NULL, 1568603236);
INSERT INTO `repo_unit` (`id`, `repo_id`, `type`, `config`, `created_unix`) VALUES (5, 1, 5, NULL, 1568603236);

CREATE TABLE IF NOT EXISTS `repo_redirect` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `owner_id` INTEGER NULL, `lower_name` TEXT NOT NULL, `redirect_repo_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_repo_redirect_s` ON `repo_redirect` (`owner_id`,`lower_name`);
CREATE INDEX `IDX_repo_redirect_lower_name` ON `repo_redirect` (`lower_name`);

CREATE TABLE IF NOT EXISTS `external_login_user` (`external_id` TEXT NOT NULL, `user_id` INTEGER NOT NULL, `login_source_id` INTEGER NOT NULL, PRIMARY KEY ( `external_id`,`login_source_id` ));
CREATE INDEX `IDX_external_login_user_user_id` ON `external_login_user` (`user_id`);

CREATE TABLE IF NOT EXISTS `protected_branch` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `branch_name` TEXT NULL, `can_push` INTEGER DEFAULT 0 NOT NULL, `enable_whitelist` INTEGER NULL, `whitelist_user_i_ds` TEXT NULL, `whitelist_team_i_ds` TEXT NULL, `enable_merge_whitelist` INTEGER DEFAULT 0 NOT NULL, `merge_whitelist_user_i_ds` TEXT NULL, `merge_whitelist_team_i_ds` TEXT NULL, `approvals_whitelist_user_i_ds` TEXT NULL, `approvals_whitelist_team_i_ds` TEXT NULL, `required_approvals` INTEGER DEFAULT 0 NOT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_protected_branch_s` ON `protected_branch` (`repo_id`,`branch_name`);

CREATE TABLE IF NOT EXISTS `user_open_id` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NOT NULL, `uri` TEXT NOT NULL, `show` INTEGER DEFAULT 0 NULL);
CREATE INDEX `IDX_user_open_id_uid` ON `user_open_id` (`uid`);
CREATE UNIQUE INDEX `UQE_user_open_id_uri` ON `user_open_id` (`uri`);

CREATE TABLE IF NOT EXISTS `issue_watch` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NOT NULL, `issue_id` INTEGER NOT NULL, `is_watching` INTEGER NOT NULL, `created_unix` INTEGER NOT NULL, `updated_unix` INTEGER NOT NULL);
CREATE UNIQUE INDEX `UQE_issue_watch_watch` ON `issue_watch` (`user_id`,`issue_id`);

CREATE TABLE IF NOT EXISTS `commit_status` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `index` INTEGER NULL, `repo_id` INTEGER NULL, `state` TEXT NOT NULL, `sha` TEXT NOT NULL, `target_url` TEXT NULL, `description` TEXT NULL, `context_hash` TEXT NULL, `context` TEXT NULL, `creator_id` INTEGER NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_commit_status_created_unix` ON `commit_status` (`created_unix`);
CREATE INDEX `IDX_commit_status_updated_unix` ON `commit_status` (`updated_unix`);
CREATE UNIQUE INDEX `UQE_commit_status_repo_sha_index` ON `commit_status` (`index`,`repo_id`,`sha`);
CREATE INDEX `IDX_commit_status_index` ON `commit_status` (`index`);
CREATE INDEX `IDX_commit_status_repo_id` ON `commit_status` (`repo_id`);
CREATE INDEX `IDX_commit_status_sha` ON `commit_status` (`sha`);
CREATE INDEX `IDX_commit_status_context_hash` ON `commit_status` (`context_hash`);

CREATE TABLE IF NOT EXISTS `stopwatch` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `issue_id` INTEGER NULL, `user_id` INTEGER NULL, `created_unix` INTEGER NULL);
CREATE INDEX `IDX_stopwatch_issue_id` ON `stopwatch` (`issue_id`);
CREATE INDEX `IDX_stopwatch_user_id` ON `stopwatch` (`user_id`);

CREATE TABLE IF NOT EXISTS `tracked_time` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `issue_id` INTEGER NULL, `user_id` INTEGER NULL, `created_unix` INTEGER NULL, `time` INTEGER NULL);
CREATE INDEX `IDX_tracked_time_issue_id` ON `tracked_time` (`issue_id`);
CREATE INDEX `IDX_tracked_time_user_id` ON `tracked_time` (`user_id`);

CREATE TABLE IF NOT EXISTS `deleted_branch` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NOT NULL, `name` TEXT NOT NULL, `commit` TEXT NOT NULL, `deleted_by_id` INTEGER NULL, `deleted_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_deleted_branch_s` ON `deleted_branch` (`repo_id`,`name`,`commit`);
CREATE INDEX `IDX_deleted_branch_repo_id` ON `deleted_branch` (`repo_id`);
CREATE INDEX `IDX_deleted_branch_deleted_by_id` ON `deleted_branch` (`deleted_by_id`);
CREATE INDEX `IDX_deleted_branch_deleted_unix` ON `deleted_branch` (`deleted_unix`);

CREATE TABLE IF NOT EXISTS `repo_indexer_status` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NULL, `commit_sha` TEXT NULL);
CREATE INDEX `IDX_repo_indexer_status_repo_id` ON `repo_indexer_status` (`repo_id`);

CREATE TABLE IF NOT EXISTS `issue_dependency` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NOT NULL, `issue_id` INTEGER NOT NULL, `dependency_id` INTEGER NOT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_issue_dependency_issue_dependency` ON `issue_dependency` (`issue_id`,`dependency_id`);

CREATE TABLE IF NOT EXISTS `lfs_lock` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `repo_id` INTEGER NOT NULL, `owner_id` INTEGER NOT NULL, `path` TEXT NULL, `created` DATETIME NULL);
CREATE INDEX `IDX_lfs_lock_owner_id` ON `lfs_lock` (`owner_id`);
CREATE INDEX `IDX_lfs_lock_repo_id` ON `lfs_lock` (`repo_id`);

CREATE TABLE IF NOT EXISTS `reaction` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` TEXT NOT NULL, `issue_id` INTEGER NOT NULL, `comment_id` INTEGER NULL, `user_id` INTEGER NOT NULL, `created_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_reaction_s` ON `reaction` (`type`,`issue_id`,`comment_id`,`user_id`);
CREATE INDEX `IDX_reaction_type` ON `reaction` (`type`);
CREATE INDEX `IDX_reaction_issue_id` ON `reaction` (`issue_id`);
CREATE INDEX `IDX_reaction_comment_id` ON `reaction` (`comment_id`);
CREATE INDEX `IDX_reaction_user_id` ON `reaction` (`user_id`);
CREATE INDEX `IDX_reaction_created_unix` ON `reaction` (`created_unix`);

CREATE TABLE IF NOT EXISTS `issue_assignees` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `assignee_id` INTEGER NULL, `issue_id` INTEGER NULL);
CREATE INDEX `IDX_issue_assignees_assignee_id` ON `issue_assignees` (`assignee_id`);
CREATE INDEX `IDX_issue_assignees_issue_id` ON `issue_assignees` (`issue_id`);

CREATE TABLE IF NOT EXISTS `u2f_registration` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NULL, `user_id` INTEGER NULL, `raw` BLOB NULL, `counter` INTEGER NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_u2f_registration_user_id` ON `u2f_registration` (`user_id`);
CREATE INDEX `IDX_u2f_registration_created_unix` ON `u2f_registration` (`created_unix`);
CREATE INDEX `IDX_u2f_registration_updated_unix` ON `u2f_registration` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `team_unit` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `org_id` INTEGER NULL, `team_id` INTEGER NULL, `type` INTEGER NULL);
CREATE INDEX `IDX_team_unit_org_id` ON `team_unit` (`org_id`);
CREATE UNIQUE INDEX `UQE_team_unit_s` ON `team_unit` (`team_id`,`type`);

CREATE TABLE IF NOT EXISTS `review` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `type` INTEGER NULL, `reviewer_id` INTEGER NULL, `issue_id` INTEGER NULL, `content` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_review_reviewer_id` ON `review` (`reviewer_id`);
CREATE INDEX `IDX_review_issue_id` ON `review` (`issue_id`);
CREATE INDEX `IDX_review_created_unix` ON `review` (`created_unix`);
CREATE INDEX `IDX_review_updated_unix` ON `review` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `oauth2_application` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `uid` INTEGER NULL, `name` TEXT NULL, `client_id` TEXT NULL, `client_secret` TEXT NULL, `redirect_uris` TEXT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE INDEX `IDX_oauth2_application_created_unix` ON `oauth2_application` (`created_unix`);
CREATE INDEX `IDX_oauth2_application_updated_unix` ON `oauth2_application` (`updated_unix`);
CREATE INDEX `IDX_oauth2_application_uid` ON `oauth2_application` (`uid`);
CREATE UNIQUE INDEX `UQE_oauth2_application_client_id` ON `oauth2_application` (`client_id`);

CREATE TABLE IF NOT EXISTS `oauth2_authorization_code` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `grant_id` INTEGER NULL, `code` TEXT NULL, `code_challenge` TEXT NULL, `code_challenge_method` TEXT NULL, `redirect_uri` TEXT NULL, `valid_until` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_oauth2_authorization_code_code` ON `oauth2_authorization_code` (`code`);
CREATE INDEX `IDX_oauth2_authorization_code_valid_until` ON `oauth2_authorization_code` (`valid_until`);

CREATE TABLE IF NOT EXISTS `oauth2_grant` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `user_id` INTEGER NULL, `application_id` INTEGER NULL, `counter` INTEGER DEFAULT 1 NOT NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_oauth2_grant_user_application` ON `oauth2_grant` (`user_id`,`application_id`);
CREATE INDEX `IDX_oauth2_grant_user_id` ON `oauth2_grant` (`user_id`);
CREATE INDEX `IDX_oauth2_grant_application_id` ON `oauth2_grant` (`application_id`);

CREATE TABLE IF NOT EXISTS `topic` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NULL, `repo_count` INTEGER NULL, `created_unix` INTEGER NULL, `updated_unix` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_topic_name` ON `topic` (`name`);
CREATE INDEX `IDX_topic_created_unix` ON `topic` (`created_unix`);
CREATE INDEX `IDX_topic_updated_unix` ON `topic` (`updated_unix`);

CREATE TABLE IF NOT EXISTS `repo_topic` (`repo_id` INTEGER NULL, `topic_id` INTEGER NULL);
CREATE UNIQUE INDEX `UQE_repo_topic_s` ON `repo_topic` (`repo_id`,`topic_id`);
