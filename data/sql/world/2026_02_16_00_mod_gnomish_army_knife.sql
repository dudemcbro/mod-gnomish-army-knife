-- Gnomish Army Knife rollout (item 40772):
-- 1) Bind on Pickup
-- 2) Grant on character creation for all race/class combinations

UPDATE `item_template`
SET `bonding` = 1
WHERE `entry` = 40772;

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`, `Note`)
SELECT `race`, `class`, 40772, 1, 'Gnomish Army Knife'
FROM `playercreateinfo`
ON DUPLICATE KEY UPDATE
    `amount` = VALUES(`amount`),
    `Note` = VALUES(`Note`);
