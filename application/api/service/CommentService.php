<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/12
 * Time: 15:22
 */

namespace app\api\service;


use app\api\model\Comment;
use app\api\model\Goods;
use app\api\model\User;

class CommentService
{
    protected $user;

    public function setUser($uid)
    {
        $user = User::get($uid);
        $this->user = $user;
        return true;
    }

    public function comments($comments)
    {
        foreach ($comments as $comment)
        {
            $this->comment($comment);
        }
        return true;
    }

    protected function comment($comment)
    {
        Comment::create([
            'user_id' => $this->user->id,
            'nickname' => $this->user->nickname,
            'avatar' => $this->user->avatar,
            'goods_id' => $comment['goods_id'],
            'details' => $comment['content'],
            'images' => $comment['images']
        ]);

        $model = Goods::get($comment['goods_id']);
        $model->setInc('comment_count');

        return true;
    }
}