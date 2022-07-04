# Terraform-101 - Companion Skript

Terraform 101 ist ein Workshop/ Tutorial zur ersten Nutzung von Terrafrom mit Beispielen der Azure Cloud. Dies hier ist ein Companion Skript zum eigentlichen Workshop, sowie ein Repository mit den verwendeten Beispielen. Solltest du nicht an dem Workshop teilgenommen haben, ruf mich an und buche gerne einen Termin unter [Fingineering](https://finginerring.net) oder [DATANOMIQ](https://datanomiq.de).

## Voraussetzungen

- Installation eines Editors: in der Demo VS Code
- Installation einer Shell, auf der Windows Plattform: PowerShell
- Installation der Azure CLI
- Installation von Terraform und Terraform Doc

**Pro-Tip**: Nutzen von Chocolatey auf der Windows Platform als Paketmanager. Darüber kann Terraform installiert werden mittels:

```powershell
choco install terraform terraform-docs
```

Auch das Aktualisieren von Terraform wird dann einfacher mittels:

```powershell
choco update all
```

## Was ist Terraform

- Laut HashiCorp (Der Entwickler von Terraform) ein Infrastructure as Code Tool. Welches es ermöglicht Infrastruktur Resourcen in der Cloud und On-Premise zu verwalten.
- Das besondere ist: Terraform ist deklarativ
- Terraform benötigt keinen zentral laufenden Service, wie z.B. Chef oder Puppet
- Die Gesamte Infrastruktur wird in ASCII beschrieben, ist daher Plattform übergreifend zu verwalten und kann auch ohne spezielle Tools gelesen werden

**Drei Schritte zur Infrastruktur**

1. **Schreiben**: Erstellen von Infrastruktur Deklaration in der Sprache HCL. Dabei wird die zu erstellende Infrastruktur in allen Teilen die am Ende vorhanden sein sollen beschrieben. Es wird nur die Ziel Konfiguration beschrieben, nicht wie man dort hin kommt
2. **Plan**: Testen der beschriebenen Konfiguration, und überprüfen, ob auch wirklich die Änderungen vorgenommen werden, die gewünscht sind. Quasi ein Trockenlauf, hier kann nachvollzogen werden, welche Einstellungen vorgenommen werden und welche Infrastruktur am Ende zu erwarten ist

```bash
terraform plan
```

1. **Anwenden**: Im letzen Schritte werden die geplanten Änderungen dann auf den Zielträger der Infrastruktur angewendet, also auf dem gewählten Hyperscaler oder auf der angesprochenen Hardware/ Virtualisierungslösung

```bash
terraform apply
```

**Terraform statefiles**

Der erwartete Sollzustand der Infrastruktur wird in einem sogenannten Statefile gespeichert.

## Ein Terraformprojekt starten

Zum Start eines neuen Terraform Infrastrukturprojekts wird nur ein leerer Ordner benötigt. In diesem Ordner werden die zu erstellenden und zu verwaltenden Ressourcen in Textdateien mit der Endung `.tf` abgelegt

Per Konvention wird zunächst eine Datei ``main.tf`` erstellt, in dieser wird definiert, welche Infratrukturprovider verwendet werden sollen, quasi welche Infrastruktur Libraries verwendet werden sollen und wie diese zu konfigurieren sind.

```terraform
terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = ">=2.2.2"
    }
    curl = {
      source = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}

provider "local" {
}
provider "curl" {

}
```

In der ersten Zeile wird Terraform als solches konfiguriert, es wird mitgeteilt, das im Projekt zwei Provider benötigt werden, *local* und *curl.* Terraform init wird damit die beiden provider aus der Terraform Registry importieren.

Anschließend können die importierten Provider mittels eines ``provider`` Blocks konfiguriert werden.

Nachdem die `[main.tf](http://main.tf)` Datei erstellt wurde, wird das Terraform Projekt initialisiert mittels

```bash
terraform init
```