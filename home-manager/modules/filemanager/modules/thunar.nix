{ ... }: {
    xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml".text = ''
        <?xml version="1.1" encoding="UTF-8"?>

        <channel name="thunar" version="1.0">
          <property name="last-view" type="string" value="ThunarDetailsView"/>
          <property name="last-icon-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_100_PERCENT"/>
          <property name="last-window-maximized" type="bool" value="true"/>
          <property name="misc-single-click" type="bool" value="false"/>
          <property name="default-view" type="string" value="ThunarDetailsView"/>
          <property name="last-details-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_38_PERCENT"/>
          <property name="last-details-view-column-widths" type="string" value="50,50,117,75,60,166,50,50,323,50,50,80,50,208"/>
          <property name="last-separator-position" type="int" value="170"/>
          <property name="hidden-bookmarks" type="array">
            <value type="string" value="network:///"/>
            <value type="string" value="file:///home/che/Desktop"/>
            <value type="string" value="computer:///"/>
            <value type="string" value="recent:///"/>
          </property>
          <property name="misc-show-delete-action" type="bool" value="false"/>
        </channel>
    '';
}
