-- One-time mail template for existing characters.
-- New characters are marked as already processed by module logic on first login.

SET @GNOMISH_ARMY_KNIFE_MAIL_ID := 90040772;

INSERT INTO `mail_server_template` (`id`, `moneyA`, `moneyH`, `subject`, `body`, `active`)
VALUES
(
    @GNOMISH_ARMY_KNIFE_MAIL_ID,
    0,
    0,
    'Gnomish Army Knife',
    'Your engineering support package includes a Gnomish Army Knife. Keep it handy.',
    1
)
ON DUPLICATE KEY UPDATE
    `moneyA` = VALUES(`moneyA`),
    `moneyH` = VALUES(`moneyH`),
    `subject` = VALUES(`subject`),
    `body` = VALUES(`body`),
    `active` = VALUES(`active`);

DELETE FROM `mail_server_template_items`
WHERE `templateID` = @GNOMISH_ARMY_KNIFE_MAIL_ID;

INSERT INTO `mail_server_template_items` (`templateID`, `faction`, `item`, `itemCount`)
VALUES
(@GNOMISH_ARMY_KNIFE_MAIL_ID, 'Alliance', 40772, 1),
(@GNOMISH_ARMY_KNIFE_MAIL_ID, 'Horde', 40772, 1);

DELETE FROM `mail_server_template_conditions`
WHERE `templateID` = @GNOMISH_ARMY_KNIFE_MAIL_ID;

INSERT INTO `mail_server_template_conditions` (`templateID`, `conditionType`, `conditionValue`, `conditionState`)
VALUES
(@GNOMISH_ARMY_KNIFE_MAIL_ID, 'PlayTime', 1, 0);
