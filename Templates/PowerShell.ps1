<#
      .SYNOPSIS
      This script is a template
      .DESCRIPTION
      Used as a base for writing scripts
      .PARAMETER Number
      A number that does stuff
      .PARAMETER Text
      Text used in the script
      .EXAMPLE
      -Number 20 -Text "Hello World"
      .EXAMPLE
      -Number 69 -Text "Nice"
      .NOTES
      01/04/2023 v1 What a joke
  #>

param (
    [Int] Number = "0",
    [string] Text = "Default Text"
)

Write-Output "Error"
Exit 1

Write-Output "Completed"
Exit 0