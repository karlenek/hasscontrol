using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.System;

class MenuDelegate extends Ui.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var itemId = item.getId();

        if (item instanceof EntityCheckbox) {
            item.entity.setShow(item.isChecked());
            App.getApp().hassController.persistEntities();
            return;
        }

        if (itemId == MenuController.MENU_SWITCH_TO_ENTITIES) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);

            App.getApp().viewController.switchEntityView();
            return true;
        }
        if (itemId == MenuController.MENU_SWITCH_TO_SCENES) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);

            App.getApp().viewController.switchSceneView();
            return true;
        }
        if (itemId == MenuController.MENU_LOGOUT) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            App.getApp().logout();
            return true;
        }
        if (itemId == MenuController.MENU_LOGIN) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            App.getApp().login(null);
            return true;
        }
        if (itemId == MenuController.MENU_ENTER_SETTINGS) {
            App.getApp().menu.showSettingsMenu();
            return true;
        }
        if (itemId == MenuController.MENU_SELECT_ENTITIES) {
            App.getApp().menu.showEntitiesMenu();
            return true;
        }
        if (itemId == MenuController.MENU_SELECT_START_VIEW) {
            App.getApp().menu.showSelectStartViewMenu();
            return true;
        }
        if (itemId == MenuController.MENU_REFRESH_ENTITIES) {
            App.getApp().hassController.fetchEntities();
            return true;
        }

        if (itemId == MenuController.MENU_SELECT_START_VIEW_ENTITIES) {
            App.getApp().setStartView(HassControlApp.ENTITIES_VIEW);

            // TOTO: This is a dirty hack to get the parent menu to re render
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            App.getApp().menu.showSettingsMenu();
            return true;
        }
        if (itemId == MenuController.MENU_SELECT_START_VIEW_SCENES) {
            App.getApp().setStartView(HassControlApp.SCENES_VIEW);

            // TOTO: This is a dirty hack to get the parent menu to re render
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            App.getApp().menu.showSettingsMenu();
            return true;
        }

        /*
         * GLOBAL MENU OPTIONS
        */
        if (itemId == MenuController.MENU_BACK) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            return true;
        }
    }
}