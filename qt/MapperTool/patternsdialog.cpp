#include <QFileDialog>
#include <QDebug>
#include "patternsdialog.h"
#include "ui_patternsdialog.h"

PatternsDialog::PatternsDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::PatternsDialog)
{
    ui->setupUi(this);

    dataPath = "";  // TODO: get from settings

    patternManager = new PatternManager();
}

PatternsDialog::~PatternsDialog()
{
    delete ui;
    delete patternManager;
}

void PatternsDialog::selectPatterns()
{
    QStringList fileNames = QFileDialog::getOpenFileNames(this, tr("Open pattern images"), dataPath, "Images (*.jpg *.tif)");

    ui->listWidget->clear();
    ui->listWidget->addItems(fileNames);
    ui->listWidget->setEnabled(true);
}