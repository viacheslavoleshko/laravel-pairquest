<?php

use App\Http\Controllers\AccessoryController;
use App\Http\Controllers\GeneratedTaskController;
use App\Http\Controllers\ImportExportController;
use App\Http\Controllers\LikeController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\PartnerController;
use App\Http\Controllers\PreferenceController;
use App\Http\Controllers\QuestController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });




Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('/tasks-import', [ImportExportController::class, 'tasksImport'])->name('tasks-import');
    Route::get('/tasks-export', [ImportExportController::class, 'tasksExport'])->name('tasks-export');
    Route::post('/partner-tasks-import', [ImportExportController::class, 'partnerTasksImport'])->name('partner-tasks-import');
    Route::get('/partner-tasks-export', [ImportExportController::class, 'partnerTasksExport'])->name('partner-tasks-export');
});

Auth::routes();

Route::get('/', [PartnerController::class, 'index'])->name('partner');
Route::post('/partner/{user}', [PartnerController::class, 'update'])->name('partner.store');

Route::get('/prefs', [PreferenceController::class, 'index'])->name('prefs');
Route::post('/prefs/{user}', [PreferenceController::class, 'store'])->name('prefs.store');


Route::get('/locations', [LocationController::class, 'index'])->name('locations');
Route::post('/locations/{user}', [LocationController::class, 'store'])->name('locations.store');

Route::get('/accessories', [AccessoryController::class, 'index'])->name('accessories');
Route::post('/accessories/{user}', [AccessoryController::class, 'store'])->name('accessories.store');

Route::get('/quest', [QuestController::class, 'index'])->name('quest');
Route::get('/quest-duration/{duration}', [QuestController::class, 'duration'])->name('quest-duration');
Route::get('/quest-organisator/{organisator}', [QuestController::class, 'organisator'])->name('quest-organisator');
Route::post('/end-quest/{generated_task}', [QuestController::class, 'finish'])->name('end-quest');
Route::post('/like/{task}', [LikeController::class, 'store'])->name('like');

Route::post('/generator/{user}', [GeneratedTaskController::class, 'store'])->name('generator');