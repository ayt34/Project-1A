[Mesh]
    file = 'SimpleMesh.msh'
[]

[GlobalParams]
  PorousFlowDictator = dictator
[]

[Variables]
  [porepressure]
    initial_condition = 1E6
  []
[]

[FluidProperties]
  [water]
    type = SimpleFluidProperties
    bulk_modulus = 2.1E9 # Default 2e9
    viscosity = 1.0E-3 # Default 1e3
    density0 = 1000.0 # Default 1e3
  []
[]

[PorousFlowFullySaturated]
  coupling_type = Hydro
  porepressure = porepressure
  gravity = '0 0 0' # Default '0 0 -10'
  fp = water
[]

[BCs]
  [constant_withdrawal_volume]
    type = PorousFlowSink
    variable = porepressure
    flux_function = -1.00267e-2 # kg/m2/s
    boundary = inner
  []
  [constant_output_porepressure]
    type = DirichletBC
    variable = porepressure
    value = 1E6
    boundary = outer
  []
[]

[Materials]
  [permeability]
    type = PorousFlowPermeabilityConst
    permeability = '1E-12 0 0   0 1E-12 0   0 0 1E-12'
  []
[]

[Preconditioning]
  active = basic
  [basic]
    type = SMP
    full = true
  []
[]

[Executioner]
  type = Steady
  solve_type = Newton
[]

[VectorPostprocessors]
  [data]
    type = LineValueSampler
    warn_discontinuous_face_values = false
    start_point = '1 0 0'
    end_point = '20 0 0'
    num_points = 100
    sort_by = x
    variable = 'porepressure'
    execute_on = TIMESTEP_END
  []
[]

[Outputs]
  execute_on = 'initial timestep_end'
  exodus = true
  csv = true
[]