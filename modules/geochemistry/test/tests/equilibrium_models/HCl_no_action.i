# This is an example of an input file that does not utilize an action.  Its functionality is the same as HCl.i
# This solves for molalities in a system just containing HCl
[GlobalParams]
  point = '0 0 0'
[]

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx= 1
[]

[Variables]
  [./u]
  [../]
[]

[Kernels]
  [./u]
    type = Diffusion
    variable = u
  [../]
[]

[AuxVariables]
  [./solution_temperature]
  [../]
  [./kg_solvent_H2O]
  [../]
  [./activity_H2O]
  [../]
  [./bulk_moles_H2O]
  [../]
  [./pH]
  [../]
  [./molal_H+]
  [../]
  [./molal_Cl-]
  [../]
  [./molal_HCl]
  [../]
  [./molal_OH-]
  [../]
  [./mg_per_kg_H+]
  [../]
  [./mg_per_kg_Cl-]
  [../]
  [./mg_per_kg_HCl]
  [../]
  [./mg_per_kg_OH-]
  [../]
  [./activity_H+]
  [../]
  [./activity_Cl-]
  [../]
  [./activity_HCl]
  [../]
  [./activity_OH-]
  [../]
  [./bulk_moles_H+]
  [../]
  [./bulk_moles_Cl-]
  [../]
  [./bulk_moles_HCl]
  [../]
  [./bulk_moles_OH-]
  [../]
[]

[AuxKernels]
  [./solution_temperature]
    type = GeochemistryQuantityAux
    species = 'H+'
    reactor = reactor
    variable = solution_temperature
    quantity = temperature
  [../]
  [./kg_solvent_H2O]
    type = GeochemistryQuantityAux
    species = 'H2O'
    reactor = reactor
    variable = kg_solvent_H2O
    quantity = molal
  [../]
  [./activity_H2O]
    type = GeochemistryQuantityAux
    species = 'H2O'
    reactor = reactor
    variable = activity_H2O
    quantity = activity
  [../]
  [./bulk_moles_H2O]
    type = GeochemistryQuantityAux
    species = 'H2O'
    reactor = reactor
    variable = bulk_moles_H2O
    quantity = bulk_moles
  [../]
  [./pH]
    type = GeochemistryQuantityAux
    species = 'H+'
    reactor = reactor
    variable = pH
    quantity = neglog10a
  [../]
  [./molal_H+]
    type = GeochemistryQuantityAux
    species = 'H+'
    reactor = reactor
    variable = 'molal_H+'
    quantity = molal
  [../]
  [./molal_Cl-]
    type = GeochemistryQuantityAux
    species = 'Cl-'
    reactor = reactor
    variable = 'molal_Cl-'
    quantity = molal
  [../]
  [./molal_HCl]
    type = GeochemistryQuantityAux
    species = 'HCl'
    reactor = reactor
    variable = 'molal_HCl'
    quantity = molal
  [../]
  [./molal_OH-]
    type = GeochemistryQuantityAux
    species = 'OH-'
    reactor = reactor
    variable = 'molal_OH-'
    quantity = molal
  [../]
  [./mg_per_kg_H+]
    type = GeochemistryQuantityAux
    species = 'H+'
    reactor = reactor
    variable = 'mg_per_kg_H+'
    quantity = mg_per_kg
  [../]
  [./mg_per_kg_Cl-]
    type = GeochemistryQuantityAux
    species = 'Cl-'
    reactor = reactor
    variable = 'mg_per_kg_Cl-'
    quantity = mg_per_kg
  [../]
  [./mg_per_kg_HCl]
    type = GeochemistryQuantityAux
    species = 'HCl'
    reactor = reactor
    variable = 'mg_per_kg_HCl'
    quantity = mg_per_kg
  [../]
  [./mg_per_kg_OH-]
    type = GeochemistryQuantityAux
    species = 'OH-'
    reactor = reactor
    variable = 'mg_per_kg_OH-'
    quantity = mg_per_kg
  [../]
  [./activity_H+]
    type = GeochemistryQuantityAux
    species = 'H+'
    reactor = reactor
    variable = 'activity_H+'
    quantity = activity
  [../]
  [./activity_Cl-]
    type = GeochemistryQuantityAux
    species = 'Cl-'
    reactor = reactor
    variable = 'activity_Cl-'
    quantity = activity
  [../]
  [./activity_HCl]
    type = GeochemistryQuantityAux
    species = 'HCl'
    reactor = reactor
    variable = 'activity_HCl'
    quantity = activity
  [../]
  [./activity_OH-]
    type = GeochemistryQuantityAux
    species = 'OH-'
    reactor = reactor
    variable = 'activity_OH-'
    quantity = activity
  [../]
  [./bulk_moles_H+]
    type = GeochemistryQuantityAux
    species = 'H+'
    reactor = reactor
    variable = 'bulk_moles_H+'
    quantity = bulk_moles
  [../]
  [./bulk_moles_Cl-]
    type = GeochemistryQuantityAux
    species = 'Cl-'
    reactor = reactor
    variable = 'bulk_moles_Cl-'
    quantity = bulk_moles
  [../]
  [./bulk_moles_HCl]
    type = GeochemistryQuantityAux
    species = 'HCl'
    reactor = reactor
    variable = 'bulk_moles_HCl'
    quantity = bulk_moles
  [../]
  [./bulk_moles_OH-]
    type = GeochemistryQuantityAux
    species = 'OH-'
    reactor = reactor
    variable = 'bulk_moles_OH-'
    quantity = bulk_moles
  [../]
[]

[Postprocessors]
  [./pH]
    type = PointValue
    variable = 'pH'
  [../]
  [./solvent_mass]
    type = PointValue
    variable = 'kg_solvent_H2O'
  [../]
  [./molal_Cl-]
    type = PointValue
    variable = 'molal_Cl-'
  [../]
  [./mg_per_kg_HCl]
    type = PointValue
    variable = 'mg_per_kg_HCl'
  [../]
  [./activity_OH-]
    type = PointValue
    variable = 'activity_OH-'
  [../]
  [./bulk_H+]
    type = PointValue
    variable = 'bulk_moles_H+'
  [../]
  [./temperature]
    type = PointValue
    variable = 'solution_temperature'
  [../]
[]

[Executioner]
  type = Steady
[]

[UserObjects]
  [./definition]
    type = GeochemicalModelDefinition
    database_file = "../../../database/moose_geochemdb.json"
    basis_species = "H2O H+ Cl-"
    piecewise_linear_interpolation = true # to reproduce the GWB result
  [../]
  [./reactor]
    type = GeochemistryTimeDependentReactor
    model_definition = definition
    charge_balance_species = "Cl-"
    constraint_species = "H2O H+ Cl-"
    constraint_value = "  1.0 1E-2 1E-2"
    constraint_meaning = "kg_solvent_water activity moles_bulk_species"
    ramp_max_ionic_strength_initial = 0 # max_ionic_strength in such a simple problem does not need ramping
    abs_tol = 1E-15
  [../]
  [./nnn]
    type = NearestNodeNumberUO
  [../]
[]

[Outputs]
  csv = true
  [./console_output]
    type = GeochemistryConsoleOutput
    geochemistry_reactor = reactor
    nearest_node_number_UO = nnn
    solver_info = true
    execute_on = initial
  [../]
[]
