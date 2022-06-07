# Tools.BaseModuleGenerator

---

Module Powershell permettant de générer une base de module.  

Génére les fichiers :
> NomDuModule.psd1  
> NomDuModule.psm1  

Génére les dossiers :
> Private  
> Public  

### Exemple

```Powershell
New-TemplateModule -Name "MyFirstModule" -Path "C:\Users\Tom\Documents\WindowsPowerShell\Module"
```

```Powershell
New-TemplateModule -Name "MyFirstModule" -Path "C:\Users\Tom\Documents\WindowsPowerShell\Module" -Author "Tom"
```

```Powershell
New-TemplateModule -Name "MyFirstModule"
```

---

# Importation

Pour installer le module, il suffit simplement de télécharger l'archive des sources.  
Extraire le contenu dans un dossier du même nom que le module soit : **Tools.BaseModuleGenerator**  

Ce dossier doit donc cointenir les dossiers et fichier suivant :  

> Private  
> Public  
> Tools.BaseModuleGenerator.psd1  
> Tools.BaseModuleGenerator.psm1  

Le dossier doit être placer dans votre répertoire de module.  
_Exemple :_  
```
C:\Program Files\WindowsPowerShell\Modules
```
```
C:\Users\Tom\Documents\WindowsPowerShell\Module
```


Après avori placé le dossier dans votre répertoire de module, il suffit de l'importer :

```Powershell
Import-Module Tools.BaseModuleGenerator -Force
```

A noter que le _-Force_ n'est pas obligatoire si le module n'a pas déjà été importé.
