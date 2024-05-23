<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "order".
 *
 * @property int $id
 * @property string $tech_type
 * @property string $tech_model
 * @property string $problem_description
 * @property string $date_start
 * @property string|null $date_end
 * @property int $client_id
 * @property int $status_id
 *
 * @property User $client
 * @property Comment[] $comments
 * @property OrderWorker[] $orderWorkers
 * @property OrderStatus $status
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tech_type', 'tech_model', 'problem_description', 'date_start', 'client_id', 'status_id'], 'required'],
            [['date_start', 'date_end'], 'safe'],
            [['client_id', 'status_id'], 'integer'],
            [['tech_type', 'tech_model', 'problem_description'], 'string', 'max' => 255],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrderStatus::class, 'targetAttribute' => ['status_id' => 'id']],
            [['client_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['client_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tech_type' => 'Tech Type',
            'tech_model' => 'Tech Model',
            'problem_description' => 'Problem Description',
            'date_start' => 'Date Start',
            'date_end' => 'Date End',
            'client_id' => 'Client ID',
            'status_id' => 'Status ID',
        ];
    }

    /**
     * Gets query for [[Client]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(User::class, ['id' => 'client_id']);
    }

    /**
     * Gets query for [[Comments]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::class, ['order_id' => 'id']);
    }

    /**
     * Gets query for [[OrderWorkers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderWorkers()
    {
        return $this->hasMany(OrderWorker::class, ['order_id' => 'id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(OrderStatus::class, ['id' => 'status_id']);
    }
}
