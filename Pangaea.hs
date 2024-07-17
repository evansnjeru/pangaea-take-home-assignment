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

data Result a b
  = Ok a
  | Error b

data SubscriptionError
  = BadUrl
  | TopicUnavailable

type CreateSubscription = Url -> Topic -> Result Subscription SubscriptionError 

type PublishMessage = Topic -> Message -> Result Payload SubscriptionError 

type Subscribe = Subscriber -> Topic -> Result Subscriber SubscriptionError
