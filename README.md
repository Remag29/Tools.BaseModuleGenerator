# Tools.BaseModuleGenerator

---

Module Powershell permettant de générer une base de module.
Les fichiers :
> NomDuModule.psd1  
> NomDuModule.psm1  

Les dossiers :
> Private  
> Public  

### Exemple

```Powershell
New-TemplateModule -Name "MyFirstModule" -Path "C:\Users\Tom\Documents\WindowsPowerShell\Module"
```

```Powershell
New-TemplateModule -Name "MyFirstModule" -Path "C:\Users\Tom\Documents\WindowsPowerShell\Module" -Author "Tom"
```
