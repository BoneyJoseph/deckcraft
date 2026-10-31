//! Offline community edition. No upstream release requests or self-updater.

use crate::SlideApp;

#[derive(Default)]
pub(crate) struct Runtime;

pub(crate) fn enable(_app: &mut SlideApp) {
    // Intentionally no-op: this edition receives updates through user-installed DMGs.
}

pub(crate) fn tick(app: &mut SlideApp, _ctx: &egui::Context) {
    let _ = &app.updates_rt;
}

pub(crate) fn show(_app: &mut SlideApp, _ctx: &egui::Context) {}
