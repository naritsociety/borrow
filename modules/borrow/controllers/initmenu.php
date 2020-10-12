<?php
/**
 * @filesource modules/borrow/controllers/initmenu.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Borrow\Initmenu;

use Gcms\Login;
use Kotchasan\Http\Request;
use Kotchasan\Language;

/**
 * Init Module.
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Controller extends \Kotchasan\KBase
{
    /**
     * ฟังก์ชั่นเริ่มต้นการทำงานของโมดูลที่ติดตั้ง
     * และจัดการเมนูของโมดูล.
     *
     * @param Request                $request
     * @param \Index\Menu\Controller $menu
     * @param array                  $login
     */
    public static function execute(Request $request, $menu, $login)
    {
        $menu->addTopLvlMenu('inventory', '{LNG_Inventory}', 'index.php?module=borrow-inventory', null, 'member');
        $submenus = array();
        foreach (Language::get('BORROW_STATUS') as $type => $text) {
            $submenus[] = array(
                'text' => $text,
                'url' => 'index.php?module=borrow-setup&amp;status='.$type,
            );
        }
        $submenus[] = array(
            'text' => '{LNG_Un-Returned items}',
            'url' => 'index.php?module=borrow-setup&amp;status=2&amp;due=1',
        );
        $submenus[] = array(
            'text' => '{LNG_Add Borrow}',
            'url' => 'index.php?module=borrow',
        );
        $menu->addTopLvlMenu('borrow', '{LNG_Borrow} &amp; {LNG_Return}', null, $submenus, 'member');
        // สามารถอนุมัติได้
        if (Login::checkPermission($login, 'can_approve_borrow')) {
            $submenus = array();
            foreach (Language::get('BORROW_STATUS') as $type => $text) {
                $submenus[] = array(
                    'text' => $text,
                    'url' => 'index.php?module=borrow-report&amp;status='.$type,
                );
            }
            $submenus[] = array(
                'text' => '{LNG_Un-Returned items}',
                'url' => 'index.php?module=borrow-report&amp;status=2&amp;due=1',
            );
            $menu->addTopLvlMenu('report', '{LNG_Report}', 'index.php?module=report', array(
                array(
                    'text' => '{LNG_Borrow} &amp; {LNG_Return}',
                    'submenus' => $submenus,
                ),
            ), 'member');
            if (Login::checkPermission($login, 'can_config')) {
                $menu->add('settings', '{LNG_Settings} {LNG_Borrow} &amp; {LNG_Return}', 'index.php?module=borrow-settings', null, 'borrow');
            }
        }
    }
}
