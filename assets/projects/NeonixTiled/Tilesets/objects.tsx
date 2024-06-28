<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.10" tiledversion="1.10.2" name="objects" tilewidth="32" tileheight="32" tilecount="17" columns="17">
 <editorsettings>
  <export target="../../../data/maps/Sets/objects.lua" format="lua"/>
 </editorsettings>
 <image source="../../../images/objects.png" width="544" height="32"/>
 <tile id="0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="h" type="int" value="6"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="obj_spike_up"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="13"/>
   <property name="special" type="bool" value="false"/>
   <property name="visible" type="bool" value="true"/>
   <property name="w" type="int" value="32"/>
  </properties>
 </tile>
 <tile id="1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="h" type="int" value="6"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="obj_spike_down"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="13"/>
   <property name="special" type="bool" value="false"/>
   <property name="visible" type="bool" value="true"/>
   <property name="w" type="int" value="32"/>
  </properties>
 </tile>
 <tile id="2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="h" type="int" value="32"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="obj_spike_left"/>
   <property name="offsetX" type="int" value="13"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="false"/>
   <property name="visible" type="bool" value="true"/>
   <property name="w" type="int" value="6"/>
  </properties>
 </tile>
 <tile id="3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="h" type="int" value="32"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="obj_spike_right"/>
   <property name="offsetX" type="int" value="13"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="false"/>
   <property name="visible" type="bool" value="true"/>
   <property name="w" type="int" value="6"/>
  </properties>
 </tile>
 <tile id="4">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="40"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="obj_jump_orb"/>
   <property name="offsetX" type="int" value="-4"/>
   <property name="offsetY" type="int" value="-4"/>
   <property name="special" type="bool" value="false"/>
   <property name="visible" type="bool" value="true"/>
   <property name="w" type="int" value="40"/>
  </properties>
 </tile>
 <tile id="5">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="h" type="int" value="16"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="obj_saw"/>
   <property name="offsetX" type="int" value="8"/>
   <property name="offsetY" type="int" value="8"/>
   <property name="special" type="bool" value="false"/>
   <property name="visible" type="bool" value="true"/>
   <property name="w" type="int" value="16"/>
  </properties>
 </tile>
 <tile id="6">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="speed_up"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="7">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="speed_down"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="8">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="start_pos"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="9">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="end_pos"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="10">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="h" type="int" value="32"/>
   <property name="hazard" type="bool" value="true"/>
   <property name="hitbox" type="bool" value="true"/>
   <property name="objname" value="killzone"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="32"/>
  </properties>
 </tile>
 <tile id="11">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="obj_hide"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="12">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="obj_show"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="13">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="direction" type="int" value="0"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="lifetime" type="int" value="-1"/>
   <property name="objname" value="particle_emitter"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="14">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="obj_gamemode_cube"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="15">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="obj_gamemode_float"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
 <tile id="16">
  <properties>
   <property name="collidable" type="bool" value="false"/>
   <property name="h" type="int" value="0"/>
   <property name="hazard" type="bool" value="false"/>
   <property name="hitbox" type="bool" value="false"/>
   <property name="objname" value="obj_gamemode_dart"/>
   <property name="offsetX" type="int" value="0"/>
   <property name="offsetY" type="int" value="0"/>
   <property name="special" type="bool" value="true"/>
   <property name="visible" type="bool" value="false"/>
   <property name="w" type="int" value="0"/>
  </properties>
 </tile>
</tileset>
