QT.printsupport.VERSION = 5.12.5
QT.printsupport.name = QtPrintSupport
QT.printsupport.module = Qt5PrintSupport_conda
QT.printsupport.libs = $$QT_MODULE_LIB_BASE
QT.printsupport.includes = $$QT_MODULE_INCLUDE_BASE $$QT_MODULE_INCLUDE_BASE/QtPrintSupport
QT.printsupport.frameworks =
QT.printsupport.bins = $$QT_MODULE_BIN_BASE
QT.printsupport.plugin_types = printsupport
QT.printsupport.depends = core gui widgets
QT.printsupport.uses =
QT.printsupport.module_config = v2
QT.printsupport.DEFINES = QT_PRINTSUPPORT_LIB
QT.printsupport.enabled_features = printer printdialog printpreviewwidget printpreviewdialog
QT.printsupport.disabled_features =
QT_CONFIG += printer printdialog printpreviewwidget printpreviewdialog
QT_MODULES += printsupport
