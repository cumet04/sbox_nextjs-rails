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
  const host = "http://localhost:3000";
  const resp = await fetch(`${host}/events`).then((resp) => resp.json());
  const eventData: EventData[] = resp["events"];

  return {
    props: {
      eventData,
    },
  };
};
