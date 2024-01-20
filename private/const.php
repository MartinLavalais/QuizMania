<?php
/*
 * Author Name : Martin Lavalais
 * Web Site Name : Atlas Quiz
 * Description : Constante to simplify the developer life
 * You can change it if you want before deployment
 */

 // Constante for cookie
 define("COOKIE_NAME", "atlas_token");

 // Constante for session
 define("SESSION_ERROR", "errorMessage");
 define("SESSION_TEMP_INFO", "tempInfo");

 // Constante for folder
 define("FOLDER_ROOT", "http://localhost/Ubuntu/QuizMania/");
 define("FOLDER_PUBLIC", FOLDER_ROOT . "public/");
 define("FOLDER_IMAGES", FOLDER_PUBLIC . "images/"); 
 define("FOLDER_ICONS", FOLDER_IMAGES . "icons/");
 define("FOLDER_CSS", FOLDER_PUBLIC . "css/");
 define("FOLDER_JS", FOLDER_PUBLIC . "js/");

 // Constante for file
 define("FILE_LOGO", FOLDER_IMAGES . "logo.png");
 define("FILE_DEFAULT_ICON", FOLDER_ICONS . "default-user.png");