<?php
	echo "<td width=\"20px\"><input id=\"active_" . $_['calendar']["id"] . "\" type=\"checkbox\" onClick=\"oc_cal_calender_activation(this, " . $_['calendar']["id"] . ")\"" . ($_['calendar']["active"] ? ' checked="checked"' : '') . "></td>";
	echo "<td><label for=\"active_" . $_['calendar']["id"] . "\">" . $_['calendar']["displayname"] . "</label></td>";
	echo "<td width=\"20px\"><a href=\"#\" onclick=\"showcaldavurl('" . OC_User::getUser() . "', '" . $_['calendar']["uri"] . "');\" title=\"" . $l->t("CalDav Link") . "\" class=\"action\"><img  class=\"svg action\" src=\"../../core/img/actions/public.svg\"></a></td><td width=\"20px\"><a href=\"export.php?calid=" . $_['calendar']["id"] . "\" title=\"" . $l->t("Download") . "\" class=\"action\"><img  class=\"svg action\" src=\"../../core/img/actions/download.svg\"></a></td><td width=\"20px\"><a  href=\"#\" title=\"" . $l->t("Edit") . "\" class=\"action\" onclick=\"oc_cal_editcalendar(this, " . $_['calendar']["id"] . ");\"><img class=\"svg action\" src=\"../../core/img/actions/rename.svg\"></a></td>";
