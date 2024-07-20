newtype Topic = Topic String

newtype Url = Url String

data Subscription = Subscription {
  url :: Url,
  topic :: Topic
}

data Subscriber = Subscriber {
  topics :: [Topic]
}

newtype Message = Message String

data Payload = Payload {
  subscription :: Subscription,
  message :: Message,
  subscribers :: [Subscriber]
}

data SubscriptionError
  = BadUrl
  | TopicUnavailable

type CreateSubscription = Url -> Topic -> Either SubscriptionError Subscription

type PublishMessage = Topic -> Message -> Either SubscriptionError Payload

type Subscribe = Subscriber -> Topic -> Either SubscriptionError Subscriber
