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

type CreateSubscription = Url -> Topic -> Subscription

type PublishMessage = Topic -> Message -> Payload 

type Subscribe = Subscriber -> Topic -> Subscriber
