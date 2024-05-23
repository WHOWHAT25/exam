<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\OrderWorker $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="order-worker-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'is_executor')->textInput() ?>

    <?= $form->field($model, 'order_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Order::find()->all(), 'id', 'tech_model')) ?>

    <?= $form->field($model, 'worker_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\User::find()->all(), 'id', 'name')) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
