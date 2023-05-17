extends Node
class_name BaseReward

@export var id = 0 #唯一ID
@export var reward_name = "" #奖励名称
@export var reward_image :Texture #奖励图片
@export_multiline var reward_info = "" #奖励详情
@export var only_start = false #是否只触发start方法

@export_group("Signal")
@export var connect_beforeAtk = false#怪物收到伤害前触发
@export var connect_afterAtk = false#怪物收到伤害后触发
@export var connect_beforePlayerHit = false#玩家收到伤害前触发
@export var connect_afterPlayerHit = false#玩家收到伤害后触发
@export var connect_kill = false#击杀怪物后触发

func _ready():
	add_to_group("reward")
	onRewardStart()
	if only_start:
		RewardServer.removeReward(self)

func onRewardStart():
	pass

func onRewardRemove():
	pass

func afterAtk(monster:BaseMonster,hit_num):#怪物收到伤害后触发
	return hit_num

func beforeAtk(monster:BaseMonster,hit_num):#怪物收到伤害前触发
	return hit_num

func beforePlayerHit(hit_num):#玩家收到伤害前触发
	return hit_num

func afterPlayerHit(hit_num): #玩家收到伤害后触发
	return hit_num

func onKill(monster:BaseMonster): #击杀后触发
	pass

func _exit_tree():
	onRewardRemove()
