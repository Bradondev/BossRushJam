class_name Boss extends Node2D


signal Dead
signal StartEnemyTurn
signal StartPlayerTurn
@export var Name = ""
@export var MaxHealth: int
var CurrentHealth = 100
var WeaknessList = []
var Shield = 0
@onready var HealthBar = $Healthbar

# Called when the node enters the scene tree for the first time.
func _ready():
	for weakness in $WeaknessHolder.get_children():
		WeaknessList.append(weakness.WeaknessType)
	
	
	CurrentHealth = MaxHealth
	HealthBar.max_value = MaxHealth
	HealthBar.value = CurrentHealth
	UpdateLabels()
	TakeDamage(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Shield > 0: 
		$ShieldIcon.visible = true
	else :
		$ShieldIcon.visible = false


	

func UpdateLabels():
		HealthBar.value = CurrentHealth
		$ShieldIcon/Label.text = str(Shield)
func  TakeDamage(Amount):
	if Shield >0:
		Shield -= Amount
		if Shield <= 0: 
			CurrentHealth -=Shield
			Shield = 0
		checkHealth()
		UpdateLabels()
		return
	CurrentHealth -=Amount
	checkHealth()
	UpdateLabels()
	
func  Heal(Amount):
	CurrentHealth += Amount
	checkHealth()
	UpdateLabels()
func checkHealth():
	if CurrentHealth <= 0:
		CurrentHealth = 0
		emit_signal("Dead","Boss")
		
	if CurrentHealth > MaxHealth:
		CurrentHealth = MaxHealth

	
func ShieldUpdate(Amount):
	Shield += Amount
	$ShieldIcon/Label.text = str(Shield)
