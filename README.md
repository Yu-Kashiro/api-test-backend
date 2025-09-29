# Rails API (Posts CRUD)

シンプルな Post モデルの CRUD を提供する学習用 API です。フロントエンド (Next.js) からアクセスします。

## 動作環境

- Ruby / Rails (Gemfile 参照)
- SQLite (開発用)

## セットアップ

```bash
bundle install
bin/rails db:migrate db:seed
bin/rails server -p 3001
```

これで `http://localhost:3001` で API が起動します。

## エンドポイント一覧

| メソッド | パス       | 内容                                      |
| -------- | ---------- | ----------------------------------------- |
| GET      | /posts     | 一覧取得                                  |
| GET      | /posts/:id | 詳細取得                                  |
| POST     | /posts     | 作成 (body: { post: { title, content } }) |
| PATCH    | /posts/:id | 更新                                      |
| DELETE   | /posts/:id | 削除                                      |

### サンプルリクエスト (curl)

```bash
curl -X POST http://localhost:3001/posts \
	-H 'Content-Type: application/json' \
	-d '{"post":{"title":"Test","content":"Hello"}}'
```

### レスポンス例

```json
{
  "id": 1,
  "title": "Test",
  "content": "Hello",
  "created_at": "2025-09-26T00:00:00.000Z",
  "updated_at": "2025-09-26T00:00:00.000Z"
}
```

## CORS

`rack-cors` により `http://localhost:3000` (Next.js デフォルト) を許可しています。設定は `config/initializers/cors.rb`。

## フロントエンドからの呼び出しメモ

- 作成/更新は以下どちらの JSON でも受け付けます。
  - ネスト形式: `{ "post": { "title": "...", "content": "..." } }`
  - トップレベル: `{ "title": "...", "content": "..." }`
- 必要なパラメータが欠けた場合は 400 Bad Request を JSON で返します。

## テスト

（簡易リクエストテストは後で追加予定）

```bash
bin/rails test
```

## Seed データ

`db/seeds.rb` で初期 Post を 2 件作成します。

## 今後の拡張例

- ページネーション
- 認証 (JWT 等)
- リクエストスペック追加
