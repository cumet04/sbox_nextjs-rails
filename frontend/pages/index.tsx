import type { GetServerSideProps, NextPage } from "next";

type EventData = {
  title: string;
  startAt: string;
  location: string;
};

type Event = {
  title: string;
  startAt: Date;
  location: string;
};

type Props = {
  eventData: EventData[];
};

const Home: NextPage<Props> = (props) => {
  const events: Event[] = props.eventData.map((d) => ({
    title: d.title,
    startAt: new Date(Date.parse(d.startAt)),
    location: d.location,
  }));

  return (
    <>
      <ul>
        {events.map((e) => (
          <li key={e.title}>{e.title}</li>
        ))}
      </ul>
      <style jsx>{`
        li {
          border-bottom: 1px solid black;
        }
      `}</style>
    </>
  );
};
export default Home;

export const getServerSideProps: GetServerSideProps<Props> = async (
  context
) => {
  const eventData: EventData[] = [
    { title: "event1", startAt: "2022-04-10", location: "foo" },
    { title: "event2", startAt: "2022-04-09", location: "bar" },
  ];

  return {
    props: {
      eventData,
    },
  };
};
