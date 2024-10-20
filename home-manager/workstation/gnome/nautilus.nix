{ ... }:

{

  dconf.settings = {

    "org/gnome/nautilus" = {
      icon-view = {
        default-zoom-level = "medium";
      };

      list-view = {
        default-zoom-level = "small";
        use-tree-view = true;
      };

      preferences = {
        default-folder-viewer = "list-view";
        migrated-gtk-settings = true;
        search-filter-time-type = "last_modified";
        show-create-link = true;
        show-delete-permanently = true;
        show-image-thumbnails = "always";
      };
    }
  };
}

