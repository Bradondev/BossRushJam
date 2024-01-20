class_name  Player extends Node


@export var Name = ""
@export var MaxHealth: int
var CurrentHealth = 100
var WeaknessList = []

@onready var HealthBar = $UiHolder/Healthbar
@onready var NameLabel = $UiHolder/Name
# Called when the node enters the scene tree for the first time.
func _ready():
	for weakness in $WeaknessHolder.get_children():
		WeaknessList.append(weakness.WeaknessType)
	
	CurrentHealth = MaxHealth -10
	$UiHolder/Label.text = str(CurrentHealth)
	NameLabel.text = Name
	HealthBar.max_value = MaxHealth
	HealthBar.value = CurrentHealth
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func  TakeDamage(Amount):
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
		return "dead"
	if CurrentHealth > MaxHealth:
		CurrentHealth = MaxHealth
func UpdateLabels():
	$UiHolder/Label.text = str(CurrentHealth)
	HealthBar.value = CurrentHealth
