<?php

namespace app\v1\model;

use think\Model;

class ArticleAudit extends Model
{
    protected $table = 'article_audit';
    protected $pk = 'aid';
}
